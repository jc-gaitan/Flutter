const {io} = require('../index')

//mensajes de sockets
//client -> un dispositivo conectado
io.on('connection', client => {
    console.log('Cliente Conectado');


    //se ejecuata cuando el cliente se desconecte
    client.on('disconnect', () => {
        console.log('Cliente Desconectado');
    });

    //on es para escuchar eventos, y emit para emitir
    client.on('mensaje', (payload)=> {
        console.log('mensaje!!', payload);

        //va emitir un mensaje a todos los clientes conectados
        //mensaje es el nombre del evento
        io.emit('mensaje', {admin: 'Nuevo mensaje'});

    });

});