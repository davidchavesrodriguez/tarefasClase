SELECT 1+1 Suma, VERSION() AS Versi�n, USER() "Usuario Conectado", CURDATE()as Fecha; -- Otorga Alias aos campos

USE A22DavidCR_traballadores;

SELECT * FROM centro; -- Seleccionamos da tabla centro

SELECT cen.cenNome AS Nome, cen.cenEnderezo AS Enderezo -- Seleccionamos os campos do alias cen (Siguiente l�nea)
FROM centro cen; -- CAMBIAMOS O ALIAS DE CENTRO

SELECT * 
FROM departamento dep
WHERE dep.depNumero > 120 -- Solo amosa os maiores a 120
ORDER BY dep.depPresuposto -- Ordena polo valor pedido. Usar desc ao final para orden descendente
LIMIT 2; -- Solo amosa 2 resultados
