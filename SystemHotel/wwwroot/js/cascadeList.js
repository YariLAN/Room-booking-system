$(function () {

    pathReg = 'GetRegions/'
    pathRegAdmin = '../GetRegions/'

    pathCity = 'GetCities/'
    pathCityAdmin = '../GetCities/'

    $(getRegions(pathReg, pathCity))
    $(getRegions(pathRegAdmin, pathCityAdmin))

    $(getCities(pathCity));
    $(getCities(pathCityAdmin));

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

function getRegions(pathReg, pathCity) {

    $('#country').change(function () {
        var id = $(this).val();
        $.ajax({
            type: 'GET',
            url: pathReg + id,
            success: function (data) {

                $('#region').replaceWith(data);

                $(getCities(pathCity));
            }
        });
    });
}

function getCities(pathCity) {
    $('#region').change(function () {
        // получаем выбранный id
        var idReg = $(this).val();
        $.ajax({
            type: 'GET',
            url: pathCity + idReg,
            success: function (data) {

                // заменяем содержимое присланным частичным представлением
                $('#city').replaceWith(data);
            }
        });
    });
}
