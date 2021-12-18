import $ from 'jquery'
import 'jquery-ujs'
// document.getElementById('.js_create_ratings')
// addEventListener('click', function(е) {
//     е.preventDefault()
//     console.log("hello")
//     Rails.ajax({
//         url: "/ratings_create",
//         type: "post",
//         data: "",
//         success: function(data) {},
//         error: function(data) {}
//     })


// })

// document.getElementById('.js_create_ratings')
// addEventListener('/ratings_create', function(е) {
//     е.preventDefault()
//     fetch('url', {
//             method: 'POST',
//             headers: {
//                 'Content-Type': 'application/json;charset=utf-8'
//             },
//             body: JSON.stringify({ 'name': 'test' })
//         })
//         .then(response => response.json())
//         .then(result => console.log(result))
// })

$(document).on('click', '.js_create_ratings', function() {
    var stars = $('#stars_stars_id_' + $(this).data("id")).select().val()
    console.log("hello")
    var movie_id = $(this).data("id");
    console.log(movie_id);
    console.log(stars);

    $.ajax({
        url: '/ratings_create',
        type: "post",
        data: { stars: stars, movie_id: movie_id },
        success: function(data) {
            // $('.wr-btn_' + manager_id).html("");
        },
        error: function(data) {}
    });
})