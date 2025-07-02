import numpy as np
import matplotlib.pyplot as plt

# *************************************************
# Back to back calculations to compare lift, drag 
# curves and top performance
# *************************************************

M = 4000 * 9.81  # Mass in kgf (4000 kg * 9.81 m/s^2)

# Constants
V = (150 / 3.6)  # Velocity in m/s
CL0 = 1.2  # Lift coefficient at zero angle of attack
KLr = 10  # Lift curve slope
rho = 1.2  # Air density in kg/m^3
S = 35  # Wing area in m^2

Vtop = 1000  # Top velocity in km/h

# Angle of attack range (0 to 20 degrees)
aoa_degrees = np.linspace(0, 20, 100)  # 100 points between 0 and 20 degrees
aoa_radians = np.radians(aoa_degrees)  # Convert degrees to radians

# Lift coefficient with ramp for aoa > 15 degrees
CL = (KLr * aoa_radians + CL0)
CL[aoa_degrees > 15] *= (20 - aoa_degrees[aoa_degrees > 15]) / 5

def calculate_lift(V, CL, CL0, rho, S):
    """Calculate lift force in newtons and convert to kgf."""
    Lift_newtons = (0.5 * rho * S * V**2 * CL)
    return Lift_newtons / 9.81  # Convert to kgf

def calculate_drag(CL, LD_ratio):
    """Calculate drag force based on lift coefficient and lift-to-drag ratio."""
    return CL / LD_ratio

def find_aoa_for_lift(V, CL, CL0, rho, S, M, aoa_degrees):
    """Find the angle of attack where lift equals or exceeds the mass M using a loop."""
    Lift_kgf = calculate_lift(V, CL, CL0, rho, S)
    for i, lift in enumerate(Lift_kgf):
        if lift >= M / 9.81:  # Check if lift is equal to or greater than M in kgf
            return aoa_degrees[i]
    return None  # Return None if no AoA satisfies the condition

def calculate_thrust(m, W, V):
    """Calculate thrust based on mass flow rate, nozzle exit velocity, and velocity."""
    return m * (W - V)

# Constants for thrust calculation
m = 40  # Engine mass flow rate in kg/sec
W = 300  # Nozzle exit velocity in m/s

# Define lift-to-drag ratio
LD_ratio = 15  # Example value for lift-to-drag ratio

# Lift calculation in kgf for initial velocity
Lift_kgf = calculate_lift(V, CL, CL0, rho, S)

# Print Lift Force in kgf when angle of attack is zero
print(f"Lift Force at 0 degrees AoA: {Lift_kgf[0]:.2f} kgf")

# Calculate and print Lift Force at 0 degrees AoA and V = Vtop
V_new = Vtop / 3.6  # Convert Vtop to m/s
Lift_kgf_new = calculate_lift(V_new, CL, CL0, rho, S)
print(f"Lift Force at 0 degrees AoA and V = {Vtop} km/h: {Lift_kgf_new[0]:.2f} kgf")

# Calculate AoA for velocities range
velocities_kmh = np.linspace((150 / 3.6), Vtop, 100)  # 100 points between 150 and Vtop km/h
velocities_ms = velocities_kmh / 3.6  # Convert to m/s
aoa_angles = [find_aoa_for_lift(V, CL, CL0, rho, S, M, aoa_degrees) for V in velocities_ms]

# Calculate drag for velocities from 150 km/h to Vtop
velocities_kmh_drag = np.linspace(150, Vtop, 100)  # 100 points between 150 and Vtop km/h
velocities_ms_drag = velocities_kmh_drag / 3.6  # Convert to m/s
drag_forces = []

for V in velocities_ms_drag:
    Drag_CL = calculate_drag(CL, LD_ratio)  # Calculate drag coefficient
    Drag_force = calculate_lift(V, Drag_CL, 0, rho, S)  # Calculate drag force in kgf
    drag_forces.append(Drag_force[0])  # Append the drag force for the first AoA

# Calculate thrust for velocities from 150 km/h to Vtop
thrust_values = [calculate_thrust(m, W, V) for V in velocities_ms_drag]

# Create a figure with a 2x2 grid of subplots
fig, axs = plt.subplots(2, 2, figsize=(12, 12))

# Plot AoA versus velocity
axs[0, 0].plot(velocities_kmh, aoa_angles, label="AoA vs Velocity", color="red")
axs[0, 0].set_title("Angle of Attack vs Velocity")
axs[0, 0].set_xlabel("Velocity (km/h)")
axs[0, 0].set_ylabel("Angle of Attack (degrees)")
axs[0, 0].grid(True)
axs[0, 0].legend()

# Plot Lift versus AoA
axs[0, 1].plot(aoa_degrees, Lift_kgf, label="Lift vs AoA", color="blue")
axs[0, 1].set_title("Lift vs Angle of Attack")
axs[0, 1].set_xlabel("Angle of Attack (degrees)")
axs[0, 1].set_ylabel("Lift (kgf)")
axs[0, 1].grid(True)
axs[0, 1].legend()

# Plot Drag and Thrust versus Velocity
axs[1, 0].plot(velocities_kmh_drag, drag_forces, label="Drag vs Velocity", color="green")
axs[1, 0].plot(velocities_kmh_drag, thrust_values, label="Thrust vs Velocity", color="orange")
axs[1, 0].set_title("Drag and Thrust vs Velocity")
axs[1, 0].set_xlabel("Velocity (km/h)")
axs[1, 0].set_ylabel("Force (kgf)")
axs[1, 0].grid(True)
axs[1, 0].legend()

# Plot CL versus AoA
axs[1, 1].plot(aoa_degrees, CL, label="CL vs AoA", color="purple")
axs[1, 1].set_title("Lift Coefficient vs Angle of Attack")
axs[1, 1].set_xlabel("Angle of Attack (degrees)")
axs[1, 1].set_ylabel("Lift Coefficient (CL)")
axs[1, 1].grid(True)
axs[1, 1].legend()

# Adjust layout and show the plots
plt.tight_layout()
plt.show()