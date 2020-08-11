# README

This badboy runs in docker. If you wanna do bare-metal, have at 'er.

1. **Get a .env.** The application relies on S3 for local development, so you're going to need to provide keys, region and bucket name. If that's annoying, you could rewrite the local config to use file system storage.
2. **Run `docker-compose up`.** Not much more to say about that. Go to http://localhost:3000.
3. **Create a band name.** This is a poorly written application, so you're going to have to create a "band name" database entity before the homepage will load. http://localhost:3000/band_names/new/.
4. You're in business.