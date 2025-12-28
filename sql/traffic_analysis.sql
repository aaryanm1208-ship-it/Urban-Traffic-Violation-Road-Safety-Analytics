-- Most Common Violations
SELECT violation_type, COUNT(*) AS count
FROM violations
GROUP BY violation_type
ORDER BY count DESC;

-- High-Risk Locations (Violations + Accidents)
SELECT l.area_name,
       COUNT(DISTINCT v.violation_id) AS total_violations,
       COUNT(DISTINCT a.accident_id) AS total_accidents
FROM locations l
LEFT JOIN violations v ON l.location_id = v.location_id
LEFT JOIN accidents a ON l.location_id = a.location_id
GROUP BY l.area_name
ORDER BY total_accidents DESC;

-- Revenue from Fines
SELECT SUM(fine_amount) AS total_fine_collected
FROM violations;

-- Vehicle Type vs Violations
SELECT ve.vehicle_type, COUNT(*) AS violation_count
FROM violations v
JOIN vehicles ve ON v.vehicle_id = ve.vehicle_id
GROUP BY ve.vehicle_type;
