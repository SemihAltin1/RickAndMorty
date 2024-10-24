# Rick and Morty Character Viewer

This is a simple iOS application developed in Swift that fetches and displays characters from the Rick and Morty API. The app consists of two screens: a character list and a detailed view for each character.

## Features

- **Character List Screen**: Displays a list of characters with their name and image.
- **Character Detail Screen**: Shows detailed information about the selected character, including:
  - ID
  - Name
  - Status
  - Species
  - Type
  - Gender
  - Character Image

## Project Structure

The project is organized into the following main directories:

- **Delegates**: Contains the app's delegate classes for managing the app's lifecycle.
  - `AppDelegate`: Handles application-wide configurations.
  - `SceneDelegate`: Manages scene-related lifecycle events.

- **Features**: Holds the main functionality of the app, including character listing and detail views.
  - **Characters**: The feature responsible for displaying and managing characters.
    - **Cell**: Contains the table view cell used for displaying character items.
      - `CharactersItemCell`: A custom cell that displays character information in the list.
    - **Controller**: Manages the view controllers for the character screens.
      - **Detail**: Contains the detail screen components.
        - `CharacterDetailVC`: ViewController displaying detailed character information.
      - **List**: Contains the list screen components.
        - `CharactersVC`: ViewController displaying the list of characters.
    - **DataProvider**: Provides data fetching logic for characters.
      - `CharactersDataProvider`: Handles network requests and data retrieval for characters.
      - `CharactersDataProviderProtocol`: Protocol for defining data provider methods.
    - **Response**: Models the API responses from the Rick and Morty API.
      - `CharacterDetailResponse`: Models the response for character detail data.
      - `CharactersResponse`: Models the response for the character list.
    - **ServiceManager**: Manages the interaction with external services (like the API).
      - `CharactersServiceManager`: Handles the business logic for fetching character data.
      - `CharactersServiceManagerProtocol`: Defines methods for the service manager.
    - **ViewModel**: Manages the business logic for the view controllers.
      - **Cell**: ViewModel for handling logic related to the character item cell.
        - `CharacterItemCellVM`: ViewModel for individual character cells.
      - **Detail**: ViewModel for handling logic related to the character detail screen.
        - `CharacterDetailVM`: ViewModel for the character detail screen.
        - `CharacterDetailVMProtocol`: Protocol for the character detail ViewModel.
      - **List**: ViewModel for handling logic related to the character list screen.
        - `CharactersVM`: ViewModel for the character list screen.
        - `CharactersVMProtocol`: Protocol for the character list ViewModel.

- **Resources**: Contains app resources like images, assets, etc.
  - `Assets`: Folder containing app assets and images.

- **Storyboards**: Contains the app's storyboard files.
  - `LaunchScreen`: The launch screen storyboard file.

- **Supports**: Contains support files such as Info.plist.
  - `Info`: Configuration files such as the app's Info.plist.

## Screenshots

| Character List | Character Detail |
|----------------|------------------|
| <img src="https://github.com/SemihAltin1/RickAndMorty/blob/main/images/list.PNG" width="200"> | <img src="https://github.com/SemihAltin1/RickAndMorty/blob/main/images/detail.PNG" width="200"> |

## Setup Instructions

1. Clone the repository:

   ```bash
   git clone https://github.com/SemihAltin1/RickAndMorty.git
