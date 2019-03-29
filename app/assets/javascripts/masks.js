$(document).ready(function() {
  var SPMaskBehavior = function (val) {
    return val.replace(/\D/g, '').length === 11 ? '(00) 00000-0000' : '(00) 0000-00009';
  },
  spOptions = {
    onKeyPress: function(val, e, field, options) {
        field.mask(SPMaskBehavior.apply({}, arguments), options);
      }
  };

  $('.money').mask('#,##0.00', {reverse: true});
  $('.date').mask('00/00/0000');
  $('.cpf_document').mask('000.000.000-00');
  $('.phone').mask(SPMaskBehavior, spOptions);
});
