Webtoon Demo App

This is a simple demo app for browsing popular webtoon categories, viewing details about specific webtoons, adding them to favorites, and rating them.
Features

    Home Screen: Displays a list of popular webtoon categories. Each category includes a title and a thumbnail image.
    Details Modal: Click on a webtoon category to view its details (image, title, description) in a modal overlay. You can also add the webtoon to your favorites.
    Favorites Screen: View all webtoons added to your favorites. Favorites are stored locally using Flutter's SharedPreferences.
    Rating Feature: Rate your favorite webtoons from 1 to 5 stars. The average rating is displayed dynamically on the details modal and stored locally.

Screens

    Home Screen: Browse popular webtoons
    Detail Modal: View more information and rate webtoons
    Favorites Screen: Manage your favorite webtoons

Getting Started

    Clone the repository.
    Run flutter pub get to install the required dependencies.
    Run the app using flutter run.

Dependencies

    SharedPreferences: For persistent local storage of favorites and ratings.
    Flutter Rating Bar: For the star rating UI component.

Installation

    Ensure you have Flutter installed.
    Install required packages by running:

    bash

flutter pub get

Run the app on your preferred device using:

bash

flutter run
