puts 'Checking for files in \'vuforia\' folder'
@android_zip = Dir['vuforia/vuforia-sdk-android-*.zip']
@ios_zip = Dir['vuforia/vuforia-sdk-ios-*.zip']

puts 'Found Android sdk zip' unless @android_zip.empty?
puts 'Found iOS sdk zip' unless @ios_zip.empty?

abort('Unable to find Android or iOS SDK zips inside \'vuforia\' folder. Expected files with format \'vuforia-sdk-PLATFORM-*.zip\' to exist.') if @android_zip.empty? and @ios_zip.empty?

puts 'Creating build directory'
system('mkdir -p build/include build/lib')

unless @android_zip.empty?
    puts '----------'
    puts 'Processing Android'

    puts 'Creating Directories'
    system('mkdir -p build/java vuforia/android')

    puts 'Extracting Android SDK'
    system("tar -xvf #{@android_zip.first} --directory vuforia/android")

    puts 'Copying Build Assets'
    system('cp -r vuforia/android/build/include/ build/include/')
    system('cp -r vuforia/android/build/java/ build/java/')
    system('cp -r vuforia/android/build/lib/ build/lib/')

    puts 'Cleaning Android'
    system('rm -r vuforia/android')
end

unless @ios_zip.empty?
    puts '----------'
    puts 'Processing iOS'

    puts 'Creating Directories'
    system('mkdir -p vuforia/ios')

    puts 'Extracting iOS SDK'
    system("tar -xvf #{@ios_zip.first} --directory vuforia/ios")

    puts 'Copying Build Assets'
    system('cp -r vuforia/ios/build/include/ build/include/')
    system('cp -r vuforia/ios/build/lib/ build/lib/')

    puts 'Cleaning iOS'
    system('rm -r vuforia/ios')
end

puts 'Done.'