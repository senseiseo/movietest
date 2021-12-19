import $ from 'jquery'
import 'jquery-ujs'

$(document).on('click', '.js_create_ratings', function() {
    const stars = $('#stars_stars_id_' + $(this).data("id")).select().val()
    const current_item = $(this).parents('div')[0]
    var movie_id = $(this).data("id");

    $.ajax({
        url: '/ratings_create',
        type: "post",
        data: { stars: stars, movie_id: movie_id },
        success: function(data) {
            $(current_item).fadeOut("slow")
            $('#' + movie_id + '_rating').text(data.rating_sum)
        },
        error: function(data) {}
    });
})