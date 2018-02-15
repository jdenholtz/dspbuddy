# README

Introduction

* This Web App is digital signal database with built in visualization and processing tools that utilizes the D3.js library and JavaScript to provide an attractive fluid user interface.  DSPBuddy can allow users to view and process digital signals from any device connected to the internet with no additional software installed.


Framework

* Ruby on Rails app with PostgreSQL.

* AWS S3 and carrierwave for consistent file storage/retrieval.


Usage

* Uploading a Dataset: A user can sign-in and upload a dataset (as a text file) with any number of channels (separated by tab characters). At this stage the user must enter the number of channels and sampling rate by hand and select if the dataset is to be public or private. Once the file is uploaded the user must add titles for each data channel before they can be viewed.

* Viewing a dataset: A user can navigate to a dataset and select any channel to view, the data will be displayed as signal amplitude vs time (calculated using sampling rate). Some basic statistics are calculated and displayed alongside the plot. The statistics can also be displayed on the plot.


Upcoming Features

* The features added will first focus on improving the data visualization and processing tools. There is little motivation for a user to upload a dataset if the visualization and processing tools are sub-par. Further feature rollouts will increase the types of data files accepted, read header information from files, and improve dataset database navigation.


* Data Visualization:

  - Ability to select the size of data window and scroll across data (currently entire data set is displayed).
  - Ability to download data visualization as a png.

* Processing Tools:

  - Power spectral density (PDS) analysis.
  - Noise IIR filter application (lowpass, highpass, bandpass and bandstop).

* File Uploads:

  - New features to include other file formats (.xlsx, .edf, .dat …) for upload will be continually added.
  - Ability to read in header information when uploading datasets.

* Database:

  - Addition of categories and tags for datasets and implementation of a search function to more easily find signals of interest.

