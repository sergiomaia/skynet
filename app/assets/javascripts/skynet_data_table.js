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

  if (!!$('.table-skynet-index-simple')) {
    $('.table-skynet-index-simple').DataTable({
      "lengthChange": false,
      "pageLength": 15,
      "searching": false,
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

  if (!!$('.table-skynet-index-simplest')) {
    $('.table-skynet-index-simplest').DataTable({
      "lengthChange": false,
      "paging": false,
      "pageLength": 15,
      "searching": false,
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
