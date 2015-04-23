all:
	cat dropall.sql tables.sql views.sql sample_data.sql demoscript.sql | psql -U p32002h
connect:
	psql -U p32002h
