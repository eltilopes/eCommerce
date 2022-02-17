
export function mascaraMonetaria(valor) {
    valor  = valor + ""
    if(!valor.includes('.')){
        valor = valor + '.00'
    }
    let valorNumber  = parseFloat(valor)
    valor = valorNumber.toFixed(2).toString()
    valor = valor.replace(/[\D]+/g,'');
    valor = valor.replace(/([0-9]{2})$/g, ",$1");

    if (valor.length > 6) {
        valor = valor.replace(/([0-9]{3}),([0-9]{2}$)/g, ".$1,$2");
    }
    return (
        valor
    );    
}
