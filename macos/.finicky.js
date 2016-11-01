finicky.setDefaultBrowser('com.apple.safari')
// Open Spotify links in client
finicky.onUrl(function(url, opts) {
    if (url.match(/^https?:\/\/open\.spotify\.com/)) {
        return {
            bundleIdentifier: 'com.spotify.client'
        }
    }
});
// By supplying an array of bundle identifiers, finicky opens the url in the first one
// that's currently running. If none are running, the first app in the array is started.
finicky.onUrl(function(url, opts) {
    return {
        bundleIdentifier: ['com.google.Chrome', 'com.apple.Safari', 'org.mozilla.firefox']
    }
});

