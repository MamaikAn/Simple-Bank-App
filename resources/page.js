$(function() {
    $('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
        let $target = $(e.target);
        let inputName = $target.data('value-for');
        if (!inputName) return;

        $(`input[name='${inputName}']`).val($target.data('value'));
    });
})