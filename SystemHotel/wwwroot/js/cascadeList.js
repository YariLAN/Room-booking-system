$(function () {

    $('#country').change(function () {
        var id = $(this).val();
        $.ajax({
            type: 'GET',
            url: 'GetRegions/' + id,
            success: function (data) {

                $('#region').replaceWith(data);

                $(getCities());
            }
        });
    });

    $(getCities());

    $('#searchHotel').click(function () {
        var cityId = $("#city").val();
        $.ajax({
            type: 'GET',
            url: 'Search/' + cityId,
            success: function (data) {
                $('#window-hotel').replaceWith(data);
            }
        });
    })
})

function getCities() {
    $('#region').change(function () {
        // получаем выбранный id
        var idReg = $(this).val();
        $.ajax({
            type: 'GET',
            url: 'GetCities/' + idReg,
            success: function (data) {

                // заменяем содержимое присланным частичным представлением
                $('#city').replaceWith(data);
            }
        });
    });
}