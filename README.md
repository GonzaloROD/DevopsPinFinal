Pasos para probar el Pipeline:

1- Clonar el repositorio
Clona el repositorio desde el control de versiones para tener acceso al código.

2- Agregar las llaves de acceso de administrador de AWS en el repositorio de GitHub
para que el pipeline pueda interactuar con los servicios de AWS.

3- Aplicar cambios en la rama Test: Realiza los cambios necesarios y súbelos a la rama Test del repositorio.

4- Realizar un Pull Request: Cuando se aplique el Pull Request, se ejecutará el flujo de GitHub Actions, que consta de dos etapas:
a- Terraform Plan: Se ejecuta el comando terraform plan para validar que todo esté correcto.
b- Terraform Apply: Si el plan es válido, se ejecuta el terraform apply para desplegar los cambios.

5- Acceder a la Instancia por SSH: Dentro de la instancia utiliza el comando "docker network inspect monitoring" para ver la configuración de la red Docker y obtener la IP privada del contenedor de Prometheus, usaremos esta IP para configurar Grafana como fuente de datos.

6- Acceder a Grafana: Abre Grafana usando la IP pública y el puerto 3000. Luego, accede a Configuration > Data Sources y selecciona Prometheus como fuente de datos.

7- Configurar la URL de Prometheus en Grafana: En el campo de URL de Prometheus, ingresa:
http://<IP_Prometheus>:9090
Haz clic en "Test Connection" y asegúrate de que la conexión sea exitosa.

8- Crear un Dashboard en Grafana: Crea un nuevo dashboard en Grafana y selecciona Import. Luego, ingresa el ID del dashboard: 893, o utiliza la siguiente URL para importar el dashboard:
https://grafana.com/grafana/dashboards/893-main/

9- Visualización de contenedores
Ahora tendrás un dashboard que te permitirá monitorear los contenedores en ejecución.

10- Aplicar Terraform Destroy (Manual)
Para destruir los recursos desplegados, realiza la acción de terraform destroy. Esto se hace manualmente desde el flujo de trabajo seleccionando el archivo YAML correspondiente (action) con el nombre destroy. 
