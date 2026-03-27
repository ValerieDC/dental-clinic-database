SELECT p.full_name, mp.plan_type
FROM Patients p
JOIN MembershipPlans mp ON p.membership_plan_id = mp.membership_plan_id;

SELECT d.full_name, t.treatment_name
FROM DentistTreatmentCapabilities dtc
JOIN Dentists d ON dtc.dentist_id = d.dentist_id
JOIN Treatments t ON dtc.treatment_id = t.treatment_id;

SELECT a.appointment_date, p.full_name, d.full_name
FROM Appointments a
JOIN Patients p ON a.patient_id = p.patient_id
JOIN Dentists d ON a.dentist_id = d.dentist_id;
