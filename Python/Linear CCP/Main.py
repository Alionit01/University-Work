import numpy as np

# Parameters
T_0 = 37  # Initial body temperature in °C
T_a = 20  # Ambient temperature in °C
T_measured = 32  # Measured body temperature in °C
k = 0.008  # Cooling constant (per minute)

# Calculate time since death
def time_since_death(T_measured, T_0, T_a, k):
    if T_measured <= T_a:  # If the body is at or below ambient temperature
        return "The body has reached ambient temperature; time can't be calculated."
    time = -np.log((T_measured - T_a) / (T_0 - T_a)) / k
    return time

# Calculate and display result
time = time_since_death(T_measured, T_0, T_a, k)
if isinstance(time, str):
    print(time)
else:
     print(f"Time since death: {time:.2f} minutes ({time/60:.2f} hours)")
import matplotlib.pyplot as plt

# Time range
time_range = np.linspace(0, 500, 500)  # 500 minutes

# Cooling function
def temperature_over_time(t, T_a, T_0, k):
    return T_a + (T_0 - T_a) * np.exp(-k * t)

# Calculate temperatures
temperatures = temperature_over_time(time_range, T_a, T_0, k)

# Plot
plt.figure(figsize=(8, 5))
plt.plot(time_range, temperatures, label="Body Temperature")
plt.axhline(T_a, color='red', linestyle='--', label="Ambient Temperature")
plt.scatter([0], [T_measured], color='green', label=f"Measured Temp: {T_measured}°C")
plt.title("Body Cooling Curve (Newton's Law of Cooling)")
plt.xlabel("Time (minutes)")
plt.ylabel("Temperature (°C)")
plt.legend()
plt.grid()
plt.show()
