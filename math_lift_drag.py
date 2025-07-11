import numpy as np
import matplotlib.pyplot as plt

# *************************************************
# Back to back calculations to compare lift, drag 
# curves and top performance
# *************************************************

LD = 11    # Example lift-to-drag ratio
AR = 8     # Aspect ratio
e = 0.8   # Oswald efficiency factor

# rho = 1.2      # Air density (kg/m^3)
rho = 1.2      # Density at 12000 meters (kg/m^3)
Alt = 0   # Altitude (meters)

SWing = 24.3    # Wing area (m^2)
SFrontal = 1.6    # Frontal area (m^2)
Span = 12

CL_TOTAL = 0   # Calculated at run time
KLr = 8      # Ramp coefficient
CL0 = 0.5      # Lift coefficient at zero angle of attack
AOA = 0        # Angle of attack (degrees)
CDi = 0      # Induced drag coefficient
e = 0.75    # Oswald efficiency factor
CDp = 0.0    # Profile drag coefficient
CDp_max = 0.1    # Max Profile drag coefficient

V = 0          # Velocity (m/s)
Mass = 3800    # Aircraft mass (kg)
g = 9.8        # Gravity (m/s^2)
Weight = Mass * g

m = 40;  # Engine mass flow rate (kg/s)
W = 310;  # Nozzle exit velocity (m/s)

def calculate_lift(rho, V, CL, SWing):
    return 0.5 * rho * V**2 * CL * SWing

def drag_from_lift(Lift, LD):
    return Lift / LD

def profile_drag(rho, V, SWing, CDp):
    return 0.5 * rho * V**2 * 2 * CDp * SFrontal

def engine_thrust(m, W, V):
    return m * (W - (V * 0.05)) * (1-((Alt/12000)*0.6))

def induced_drag(CDi,rho,V,SWing):
    
    return CDi * 0.5 * rho * V**2 * SWing

def induced_drag_by_lift(lift, b, rho, V, e):
    
    return (lift * lift) / (np.pi * e * rho * V * V * b * b)


V_range = np.linspace(0, 1000 / 3.6, 200)  # 0 to 1000 km/h in m/s

# Create CDp array: 0 at 300 km/h, linearly to CDp_max at 850 km/h
V_kmh = V_range * 3.6
CDp_array = np.zeros_like(V_range)
start_kmh = 500
end_kmh = 1000
for i, v_kmh in enumerate(V_kmh):
    if v_kmh <= start_kmh:
        CDp_array[i] = 0.0
    elif v_kmh >= end_kmh:
        CDp_array[i] = CDp_max
    else:
        CDp_array[i] = CDp_max * (v_kmh - start_kmh) / (end_kmh - start_kmh)

# --- Existing calculations for rho = 1.2 ---
rho = 1.2
drag_curve = []
thrust_curve = []
aoa_deg = []
acc_x = []

for idx, v in enumerate(V_range):
    lift = Weight 
    CL_TOTAL = lift / (0.5 * rho * v**2 * SWing) 
    CL_AOA = CL_TOTAL - CL0   
    AOA = CL_AOA / KLr
    aoa_deg.append(np.degrees(AOA))

    thrust = engine_thrust(m, W, v)
    thrust_curve.append(thrust)

    CDi = (CL_TOTAL ** 2) / (np.pi * e * ((Span ** 2) / SWing))
    drag_induc = induced_drag_by_lift(lift, Span, rho, v, e)
    if drag_induc >= thrust:
        drag_induc = thrust
    CDp = CDp_array[idx]
    drag = drag_from_lift(lift, LD) + profile_drag(rho, v, SWing, CDp) + drag_induc    
    drag_curve.append(drag)

    acc_x.append((thrust - drag) / Mass)

# --- New calculations for rho = 0.31 ---
rho_low = 0.31
drag_curve_low = []
thrust_curve_low = []
aoa_deg_low = []
acc_x_low = []

for idx, v in enumerate(V_range):
    lift = Weight 
    CL_TOTAL = lift / (0.5 * rho_low * v**2 * SWing) 
    CL_AOA = CL_TOTAL - CL0   
    AOA = CL_AOA / KLr
    aoa_deg_low.append(np.degrees(AOA))

    thrust = engine_thrust(m, W, v)
    thrust_curve_low.append(thrust)

    CDi = (CL_TOTAL ** 2) / (np.pi * e * ((Span ** 2) / SWing))
    drag_induc = induced_drag_by_lift(lift, Span, rho_low, v, e)
    if drag_induc >= thrust:
        drag_induc = thrust
    CDp = CDp_array[idx]
    drag = drag_from_lift(lift, LD) + profile_drag(rho_low, v, SWing, CDp) + drag_induc    
    drag_curve_low.append(drag)

    acc_x_low.append((thrust - drag) / Mass)

# --- Plotting ---
fig, axs = plt.subplots(2, 3, figsize=(20, 12))

# First row: rho = 1.2
axs[0, 0].plot(V_range * 3.6, drag_curve, label='Total Drag (N)')
axs[0, 0].plot(V_range * 3.6, thrust_curve, label='Engine Thrust (N)')
axs[0, 0].set_xlabel('Velocity (km/h)')
axs[0, 0].set_ylabel('Force (N)')
axs[0, 0].set_title('Drag and Thrust vs Velocity for L=W (rho=1.2)')
axs[0, 0].legend()
axs[0, 0].grid(True)
axs[0, 0].set_xticks(np.arange(0, np.max(V_range * 3.6) + 1, 50))
for label in axs[0, 0].get_xticklabels():
    label.set_fontsize(8)

axs[0, 1].plot(V_range * 3.6, aoa_deg, label='Angle of Attack (deg)', color='orange')
axs[0, 1].set_xlabel('Velocity (km/h)')
axs[0, 1].set_ylabel('AOA (deg)')
axs[0, 1].set_title('Angle of Attack vs Velocity for L/W = 1 (rho=1.2)')
axs[0, 1].set_ylim(top=15)
axs[0, 1].set_ylim(bottom=-15)
axs[0, 1].legend()
axs[0, 1].grid(True)
axs[0, 1].set_xticks(np.arange(0, np.max(V_range * 3.6) + 1, 50))
for label in axs[0, 1].get_xticklabels():
    label.set_fontsize(8)

axs[0, 2].plot(V_range * 3.6, acc_x, label='Acceleration X (m/s²)', color='green')
axs[0, 2].set_xlabel('Velocity (km/h)')
axs[0, 2].set_ylabel('Acceleration (m/s²)')
axs[0, 2].set_title('Longitudinal Acceleration vs Velocity (rho=1.2)')
axs[0, 2].legend()
axs[0, 2].grid(True)
axs[0, 2].set_xticks(np.arange(0, np.max(V_range * 3.6) + 1, 50))
for label in axs[0, 2].get_xticklabels():
    label.set_fontsize(8)

# Second row: rho = 0.31
axs[1, 0].plot(V_range * 3.6, drag_curve_low, label='Total Drag (N)')
axs[1, 0].plot(V_range * 3.6, thrust_curve_low, label='Engine Thrust (N)')
axs[1, 0].set_xlabel('Velocity (km/h)')
axs[1, 0].set_ylabel('Force (N)')
axs[1, 0].set_title('Drag and Thrust vs Velocity for L=W (rho=0.31)')
axs[1, 0].legend()
axs[1, 0].grid(True)
axs[1, 0].set_xticks(np.arange(0, np.max(V_range * 3.6) + 1, 50))
for label in axs[1, 0].get_xticklabels():
    label.set_fontsize(8)

axs[1, 1].plot(V_range * 3.6, aoa_deg_low, label='Angle of Attack (deg)', color='orange')
axs[1, 1].set_xlabel('Velocity (km/h)')
axs[1, 1].set_ylabel('AOA (deg)')
axs[1, 1].set_title('Angle of Attack vs Velocity for L/W = 1 (rho=0.31)')
axs[1, 1].set_ylim(top=15)
axs[1, 1].set_ylim(bottom=-15)
axs[1, 1].legend()
axs[1, 1].grid(True)
axs[1, 1].set_xticks(np.arange(0, np.max(V_range * 3.6) + 1, 50))
for label in axs[1, 1].get_xticklabels():
    label.set_fontsize(8)

axs[1, 2].plot(V_range * 3.6, acc_x_low, label='Acceleration X (m/s²)', color='green')
axs[1, 2].set_xlabel('Velocity (km/h)')
axs[1, 2].set_ylabel('Acceleration (m/s²)')
axs[1, 2].set_title('Longitudinal Acceleration vs Velocity (rho=0.31)')
axs[1, 2].legend()
axs[1, 2].grid(True)
axs[1, 2].set_xticks(np.arange(0, np.max(V_range * 3.6) + 1, 50))
for label in axs[1, 2].get_xticklabels():
    label.set_fontsize(8)

plt.tight_layout()
plt.show()

