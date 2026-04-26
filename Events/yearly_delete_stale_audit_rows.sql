USE sql_invoicing;

DELIMITER $$

ALTER EVENT yearly_delete_stale_audit_rows
ON SCHEDULE
	-- AT '2026-06-01'
    EVERY 1 YEAR STARTS '2026-01-01' ENDS '2030-01-01'
DO BEGIN
	DELETE FROM payments_audit
    WHERE action_date < NOW() - INTERVAL 1 YEAR;
END $$

DELIMITER ;
