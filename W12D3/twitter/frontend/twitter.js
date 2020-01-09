const FollowToggle = require('./follow_toggle.js');

$(() => {
    $followToggles = $(".follow-toggle");
    $followToggles.map((idx, button) => new FollowToggle(button));
    
});