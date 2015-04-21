all:
	cat dropall.sql tables.sql views.sql sample_data.sql | psql -U p32002h
