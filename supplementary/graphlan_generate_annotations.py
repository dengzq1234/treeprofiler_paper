import pandas as pd

def value_to_color(value):
    # Simple gradient: 0 (white) to 50 (red)
    red_intensity = int((value / 50.0) * 255)
    return f"#{red_intensity:02X}0000"

df = pd.read_csv("dataset_table.tsv", sep="\t")
with open("ring_annotation.txt", "w") as f:
    for _, row in df.iterrows():
        val = int(row['col1'])//10
        color = value_to_color(val*10)
        f.write(f"{row['feature_id']}\tring_height\t1\t{val}\n")
        f.write(f"{row['feature_id']}\tring_color\t1\t{color}\n")

        