import networkx as nx
import matplotlib.pyplot as plt


# Step 1: Create a sample graph
# Nodes represent bus stops
# Edges represent routes with weights: (time, distance, cost)
def create_graph():
    G = nx.Graph()

    # Add nodes
    nodes = ["A", "B", "C", "D", "E"]
    G.add_nodes_from(nodes)

    # Add edges with weights (time, distance, cost)
    edges = [
        ("A", "B", {"time": 10, "distance": 5, "cost": 2}),
        ("A", "C", {"time": 15, "distance": 10, "cost": 3}),
        ("B", "D", {"time": 12, "distance": 6, "cost": 2}),
        ("C", "D", {"time": 10, "distance": 5, "cost": 4}),
        ("D", "E", {"time": 8, "distance": 4, "cost": 1}),
    ]
    G.add_edges_from(edges)

    return G


# Step 2: Combine weights (time, distance, cost) into a single weight
# Adjust the weights if certain factors need more importance
def calculate_combined_weight(time, distance, cost, time_weight=1, distance_weight=1, cost_weight=1):
    return time * time_weight + distance * distance_weight + cost * cost_weight


# Step 3: Find the shortest path using Dijkstra's algorithm
def find_shortest_path(G, source, target, time_weight=1, distance_weight=1, cost_weight=1):
    # Create a new graph with combined weights
    weighted_graph = nx.Graph()

    for u, v, data in G.edges(data=True):
        combined_weight = calculate_combined_weight(
            data["time"], data["distance"], data["cost"], time_weight, distance_weight, cost_weight
        )
        weighted_graph.add_edge(u, v, weight=combined_weight)

    # Use Dijkstra's algorithm to find the shortest path
    path = nx.dijkstra_path(weighted_graph, source=source, target=target, weight="weight")
    path_length = nx.dijkstra_path_length(weighted_graph, source=source, target=target, weight="weight")

    return path, path_length


# Step 4: Visualize the graph and highlight the shortest path
def visualize_graph(G, shortest_path):
    pos = nx.spring_layout(G)  # Position nodes for visualization

    # Draw nodes and edges
    nx.draw(G, pos, with_labels=True, node_color="lightblue", node_size=1500, font_size=10)

    # Draw edge labels with weights (time, distance, cost)
    edge_labels = {
        (u, v): f"T:{data['time']} D:{data['distance']} C:{data['cost']}"
        for u, v, data in G.edges(data=True)
    }
    nx.draw_networkx_edge_labels(G, pos, edge_labels=edge_labels, font_size=8)

    # Highlight the shortest path
    path_edges = list(zip(shortest_path, shortest_path[1:]))
    nx.draw_networkx_edges(G, pos, edgelist=path_edges, edge_color="red", width=2)

    plt.show()


# Main Function
def main():
    G = create_graph()
    source = "A"
    target = "E"

    print("Finding shortest path from", source, "to", target)
    shortest_path, path_length = find_shortest_path(G, source, target)

    print("Shortest Path:", shortest_path)
    print("Path Length (Combined Weight):", path_length)

    visualize_graph(G, shortest_path)


if __name__ == "__main__":
    main()
