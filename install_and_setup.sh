#!/bin/bash
# 1. Update and install packages
echo "Instalando PHP y MariaDB..."
apt-get update
DEBIAN_FRONTEND=noninteractive apt-get install -y php-cli php-mysql mariadb-server

# 2. Start MariaDB service
echo "Iniciando servicio de base de datos..."
systemctl start mariadb || systemctl start mysql

# 3. Configure Database
echo "Configurando la base de datos..."
mysql -e "CREATE DATABASE IF NOT EXISTS login_db;"
mysql -e "CREATE USER IF NOT EXISTS 'farmacia'@'localhost' IDENTIFIED BY 'farmacia';"
mysql -e "GRANT ALL PRIVILEGES ON login_db.* TO 'farmacia'@'localhost';"
mysql -e "FLUSH PRIVILEGES;"

echo "Importando tablas y datos iniciales..."
mysql login_db < src/assets/sql/creacion_tablas_farmacia1.sql
mysql login_db < src/assets/sql/insertar_departamentos.sql
mysql login_db < src/assets/sql/insertar_doctores.sql
mysql login_db < src/assets/sql/insertar_clase_medicamento.sql
mysql login_db < src/assets/sql/insertar_medicamento.sql
mysql login_db < src/assets/sql/insertar_suplemento.sql
mysql login_db < src/assets/sql/insertar_proveedor.sql
mysql login_db < src/assets/sql/agregando_columna_telefno_a_paciente.sql
mysql login_db < src/assets/sql/agregando_especialidad_a_cita.sql
mysql login_db < src/assets/sql/eliminar_columna_historial_médico_paciente.sql

echo "¡Listo! Base de datos y PHP instalados y configurados."
