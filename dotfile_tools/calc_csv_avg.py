import csv
import os
import argparse # 导入 argparse 模块

def calculate_column_averages(filepath):
    """
    读取 CSV 文件，计算从第二列开始的每一列的平均值。

    Args:
        filepath (str): CSV 文件的路径。

    Returns:
        tuple: 包含表头列表和平均值字典的元组 (header, averages)。
               如果文件无法读取或处理过程中出错，则返回 (None, None)。
    """
    if not os.path.exists(filepath):
        print(f"错误：文件未找到 - {filepath}")
        return None, None

    column_sums = {}
    column_counts = {}
    header = []

    try:
        with open(filepath, mode='r', newline='', encoding='utf-8') as csvfile:
            reader = csv.reader(csvfile)

            # 读取表头
            header = next(reader)
            if len(header) < 2:
                 print(f"错误：文件 '{filepath}' 的列数少于2，无法计算平均值。")
                 return None, None

            # 初始化字典，从第一列开始
            for col_name in header:
                column_sums[col_name] = 0.0
                column_counts[col_name] = 0

            # 逐行读取数据
            for row_index, row in enumerate(reader):
                # 确保行长度与表头匹配（至少包含需要处理的列）
                if len(row) < len(header):
                    print(f"警告：第 {row_index + 2} 行数据列数不足 ({len(row)} 列，应为 {len(header)} 列)，已跳过。")
                    continue

                # 遍历从第二列开始的每一列
                for i, col_name in enumerate(header):
                    col_index = i # 实际列索引
                    value_str = row[col_index].strip() # 获取并清理字符串
                    try:
                        # 尝试将值转换为浮点数
                        value_float = float(value_str)
                        column_sums[col_name] += value_float
                        column_counts[col_name] += 1
                    except ValueError:
                        # 如果转换失败，打印警告（可以选择跳过或记录）
                        print(f"警告：第 {row_index + 2} 行，列 '{col_name}' 的值 '{value_str}' 不是有效的数字，已忽略。")
                    except IndexError:
                         # 处理潜在的索引错误（虽然前面的长度检查应该能覆盖）
                         print(f"警告：尝试访问第 {row_index + 2} 行，列索引 {col_index} 时出错，已跳过。")
                         break # 跳过当前行的剩余列

    except FileNotFoundError:
        print(f"错误：文件未找到 - {filepath}")
        return None, None
    except StopIteration:
        print(f"错误：文件 '{filepath}' 为空或只有表头。")
        return None, None
    except Exception as e:
        print(f"处理文件 '{filepath}' 时发生错误：{e}")
        return None, None

    # 计算平均值
    averages = {}
    for col_name in header:
        if column_counts.get(col_name, 0) > 0: # 使用 get 避免 Key Error
            averages[col_name] = column_sums[col_name] / column_counts[col_name]
        else:
            averages[col_name] = 0.0 # 或者可以是 None 或 float('nan')

    return header, averages # 返回表头和平均值

if __name__ == "__main__":
    # --- 设置命令行参数解析 ---
    parser = argparse.ArgumentParser(description='计算 CSV 文件数值列（从第一列开始）的平均值。')
    parser.add_argument('csv_filepath', type=str, help='要处理的 CSV 文件的路径。')
    # --- 解析参数 ---
    args = parser.parse_args()

    csv_file_path = args.csv_filepath # 从参数获取文件路径

    print(f"正在计算文件 '{csv_file_path}' 的列平均值...")
    header, column_averages = calculate_column_averages(csv_file_path)

    if header and column_averages:
        print("\n各列平均值 (从第一列开始):")
        # 按照原始表头顺序打印
        for col_name in header:
            avg = column_averages.get(col_name, float('nan')) # 使用 get 以防万一
            print(f"- {col_name}: {avg:.6f}") # 格式化输出，保留6位小数
    else:
        print("未能计算平均值。")