all:
	cat dropall.sql tables.sql sample_data.sql | psql -U p32002h
