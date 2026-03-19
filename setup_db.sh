#!/bin/bash
mysql -e "CREATE DATABASE IF NOT EXISTS login_db;"
mysql -e "CREATE USER IF NOT EXISTS 'farmacia'@'localhost' IDENTIFIED BY 'farmacia';"
mysql -e "GRANT ALL PRIVILEGES ON login_db.* TO 'farmacia'@'localhost';"
mysql -e "FLUSH PRIVILEGES;"

mysql login_db < src/assets/sql/creacion_tablas_farmacia1.sql

# El resto de los scripts parecen ser datos y modificaciones
mysql login_db < src/assets/sql/insertar_departamentos.sql
mysql login_db < src/assets/sql/insertar_doctores.sql
mysql login_db < src/assets/sql/insertar_clase_medicamento.sql
mysql login_db < src/assets/sql/insertar_medicamento.sql
mysql login_db < src/assets/sql/insertar_suplemento.sql
mysql login_db < src/assets/sql/insertar_proveedor.sql
mysql login_db < src/assets/sql/agregando_columna_telefno_a_paciente.sql
mysql login_db < src/assets/sql/agregando_especialidad_a_cita.sql
mysql login_db < src/assets/sql/eliminar_columna_historial_médico_paciente.sql

echo "Base de datos configurada exitosamente."
