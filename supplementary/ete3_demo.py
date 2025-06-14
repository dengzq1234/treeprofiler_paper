
from ete3 import Tree, TreeStyle, RectFace, faces, AttrFace
import pandas as pd

t = Tree("tree_root.nw", format=1)
df = pd.read_csv("dataset_table.tsv", sep='\t')
value_dict = dict(zip(df['feature_id'], df['col1']))

def layout(node):
    # Only add bars to leaves
    if node.is_leaf():
        name = node.name
        value = value_dict.get(name, 0)
   
        # Scale the bar width (change scale factor as needed)
        bar_width = value * 200
        bar = RectFace(width=bar_width, height=10, fgcolor="blue", bgcolor="blue")
        faces.add_face_to_node(bar, node, column=0, position="aligned")

ts = TreeStyle()
ts.layout_fn = layout
ts.show_leaf_name = False
ts.mode = "c"
ts.root_opening_factor = 0.7
ts.scale = 50
t.dist = 100

t.convert_to_ultrametric()
t.render("ete3_barplot_ultrametric.png", tree_style=ts, w=800, units="px")
