# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


Features:

<!-- #sign-up page   -->
<!-- #login page -->
#events index w/ search/filters
#my events
#######max_guests thing doesn't really work +
#errors
<!-- #######way to check attendance -->
#######way to 'un-rsvp' (delete rsvp nested resource)
#######button_to problem (old code   <!-- <%= button_to "Cancel RSVP", event_rsvp_path(@event, @rsvp), method: 'delete'%> -->
)
<!-- <form class="button_to" method="post" action="/events/<%=@event.id%>/rsvps/<%= @rsvp.id%>">
  <input type="hidden" name="_method" value="delete">
  <input type="submit" value="Cancel RSVP">
</form> -->

Clean up:
#clean up resources(only the ones we're actually using)

#Suggest an event
<!-- #hosts/guests index -->
#profile/myaccount
<!-- #rsvp form -->
<!-- #event show page -->
#view comments
#location page / search filter
<!-- #category dropdown menu? -->

#methods:
-- category query (party type)
-- category query (party type)
