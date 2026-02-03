with
	source as (
		select * from {{ source('raw', 'sales') }}
	)
select * from source