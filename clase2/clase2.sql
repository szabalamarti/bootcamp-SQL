-- consigna
use internet_clients_db;

SELECT clients.dni, clients.name, internet_plans.name AS plan_name
FROM clients
JOIN internet_plans ON clients.internet_plan_id = internet_plans.id;