import geopandas as gpd
import matplotlib.pyplot as plt
import matplotlib.patches as mpatches

import numpy as np

# Load Pakistan shapefile
pakistan = gpd.read_file("PAK_adm1.shp")

# Create map
fig, ax = plt.subplots(figsize=(12, 8))

# Plot Pakistan
pakistan.boundary.plot(ax=ax, linewidth=1, color='black')

# Define languages and their locations (approximate lat/lon)
languages = {
    "Punjabi": (31.5, 74.3),
    "Saraiki": (29.4, 71.7),
    "Sindhi": (25.4, 68.4),
    "Balochi": (27.8, 65.4),
    "Pashto": (34.0, 71.5),
    "Hindko": (33.8, 72.2),
    "Brahui": (28.5, 66.5),
    "Shina": (35.3, 74.6),
    "Balti": (35.4, 75.5),
    "Burushaski": (36.3, 74.7),
    "Wakhi": (37.0, 74.8),
    "Khowar": (36.2, 72.0),
    "Dhatki": (24.8, 70.3),
    "Marwari": (26.0, 71.0),
    "Pahari-Pothwari": (33.6, 73.0)
}

# Plot language markers
for lang, (lat, lon) in languages.items():
    ax.text(lon, lat, lang, fontsize=10, ha='right', color='blue')
    ax.scatter(lon, lat, color='red', s=50, edgecolors='black')

# Draw language connections (arrows)
connections = [
    ((31.5, 74.3), (33.8, 72.2)),  # Punjabi ↔ Hindko
    ((33.8, 72.2), (34.0, 71.5)),  # Hindko ↔ Pashto
    ((29.4, 71.7), (25.4, 68.4)),  # Saraiki ↔ Sindhi
    ((27.8, 65.4), (25.4, 68.4)),  # Balochi ↔ Sindhi
    ((35.3, 74.6), (35.4, 75.5)),  # Shina ↔ Balti
    ((36.3, 74.7), (37.0, 74.8)),  # Burushaski ↔ Wakhi
    ((36.2, 72.0), (35.3, 74.6)),  # Khowar ↔ Shina
    ((24.8, 70.3), (26.0, 71.0)),  # Dhatki ↔ Marwari
    ((33.6, 73.0), (31.5, 74.3)),  # Pahari-Pothwari ↔ Punjabi
    # Cross-border connections
    ((34.0, 71.5), (34.5, 69.2)),  # Pashto ↔ Afghanistan
    ((27.8, 65.4), (28.5, 60.8)),  # Balochi ↔ Iran
    ((35.4, 75.5), (32.0, 78.0)),  # Balti ↔ China
    ((26.0, 71.0), (27.5, 72.5))   # Marwari ↔ Rajasthan, India
]

for (lat1, lon1), (lat2, lon2) in connections:
    ax.annotate("", xy=(lon2, lat2), xytext=(lon1, lat1),
                arrowprops=dict(arrowstyle="->", lw=1.5, color='purple'))

# Create legend
legend_patches = [mpatches.Patch(color='red', label='Major Language Regions'),
                   mpatches.Patch(color='purple', label='Language Connections')]
ax.legend(handles=legend_patches, loc='lower left')

# Titles and labels
ax.set_title("Linguistic Diversity and Cross-Border Connections in Pakistan", fontsize=14)
ax.set_xlabel("Longitude")
ax.set_ylabel("Latitude")

plt.show()