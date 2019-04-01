$( document ).on('turbolinks:load', function() {
  if (!!$('.table-skynet-index')) {
    $('.table-skynet-index').DataTable({
      "language": {
        "lengthMenu": "Mostrando _MENU_ entradas por página",
        "zeroRecords": "Desculpe - nenhuma entrada foi encontrada",
        "info": "Mostrando página _PAGE_ de _PAGES_",
        "infoEmpty": "Não há entradas",
        "infoFiltered": "(filtrado de _MAX_ entradas ao total)",
        "loadingRecords": "Carregando...",
        "processing":     "Processando...",
        "search":         "Buscar:",
        "paginate": {
            "first":      "Primeiro",
            "last":       "Último",
            "next":       "Próximo",
            "previous":   "Anterior"
        },
      }
    });
  }
})
