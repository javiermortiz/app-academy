const APIUtil = require("./api_util.js")

class FollowToggle {
    constructor (el) {
        // debugger
        this.$el = $(el);
        this.userId = this.$el.data("user-id");
        this.followState = this.$el.data("initial-follow-state");
        this.render();
        this.handleClick();
    }
    
    render () {
        this.$el.prop("disabled", false);
        if (this.followState === "following" || this.followState === "unfollowing") {
            this.$el.prop("disabled", true);
        } else if (this.followState === "unfollowed") {
            this.$el.text("Follow!");
        } else {
            this.$el.text("Unfollow!");
        }
    }

    handleClick () {
        this.$el.on("click", (e) => {
            e.preventDefault();
            if (this.followState === "unfollowed") {
                this.followState = "following";
            } else {
                this.followState = "unfollowing";
            }
            this.render()
            if (this.followState === "following") {
                APIUtil.followUser(this.userId).then(() => {
                    this.followState = "followed";
                    this.render();
                })
            } else {
                APIUtil.unfollowUser(this.userId).then(() => {
                    this.followState = "unfollowed";
                    this.render();
                })
            }
        })
    }
}

module.exports = FollowToggle;