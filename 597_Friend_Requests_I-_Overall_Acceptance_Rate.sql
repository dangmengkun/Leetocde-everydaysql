solution 1
select
round(ifnull((select count(*) from (select distinct requester_id,accepter_id from request_accepted) as A)/
(select count(*) from (select distinct sender_id,send_to_id from friend_request) as B),0),2) as accept_rate

solution 2
SELECT 
    CAST(
        CASE
            WHEN COUNT(DISTINCT CONCAT(sender_id,'_',send_to_id)) = 0 THEN 0
            ELSE 
                COUNT(DISTINCT CONCAT(requester_id,'_',accepter_id))*1.0
                /
                COUNT(DISTINCT CONCAT(sender_id,'_',send_to_id))
        END
        AS DECIMAL(3,2)
    ) AS accept_rate
 FROM request_accepted, friend_request;
