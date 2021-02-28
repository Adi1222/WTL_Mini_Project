$('#myTab a').on('click', function (e) {
    e.preventDefault();
    $('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
        e.relatedTarget.classList.remove("active");
        e.relatedTarget.classList.remove("show");
    });
    $(this).tab('show');
})