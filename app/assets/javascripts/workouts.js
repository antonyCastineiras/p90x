$(document).on('turbolinks:load', function() {
	$('#save-workout-btn').click(function() {
		$('form.edit_exercise').each(function(index, form) {
			get_id_from_form(form)
		});
	});
});

function get_id_from_form(form) {
	id = form.id;
	id = id.replace('edit_exercise_','');
	console.log(id);
}