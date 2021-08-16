export interface Usuario {
    nombre: string,
    apellido: string,
    dni: number,
    usuario: string,
    clave: string,
    mail: string
}

export const usuarios: Usuario[] = [
    {
        nombre: "Maria",
        apellido: "Altamirano",
        dni: 35260152,
        usuario: "merypopins",
        clave: "clave123",
        mail: "marian_1490_1@hotmail.com" //unico
    }
]