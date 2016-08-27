module Jekyll
	class JsGenerator < Generator
		safe true
		priority :low

		def generate(site)
			motd  = "_plugins/resources/motd.txt"
			title = "_plugins/resources/title.txt"
			dst   = "js/motdSelector.js"

			# add new file to the list of static files
			site.static_files.push(JsFile.new(site, site.source, "", motd, title, dst))
		end
	end

	class JsFile < StaticFile
		def initialize(site, base, dir, motd, title, dst)
			super(site, base, dir, motd, nil)

			@srcMotd = File.join(base, motd)
			@srcTitle = File.join(base, title)
			@dir = dir
			@dst = dst
		end

		def write(dest)
			dstPath = File.join(dest, @dir)
			dstName = File.join(dstPath, @dst)

			# make sure dir exists
			FileUtils.mkdir_p(dstPath)

			js = File.open(dstName, 'w')

			js.puts "var motdArr = [];"
			js.puts "var titleArr = [];"
			js.puts "$(function() {"

			txt = File.open(@srcMotd, 'r')
			txt.readlines.each do |line|
				js.puts "\tmotdArr.push('" + line.strip.gsub("'", "\\\\'") + "');"
			end
			txt.close

			txt = File.open(@srcTitle, 'r')
			txt.readlines.each do |line|
				js.puts "\ttitleArr.push('" + line.strip.gsub("'", "\\\\'") + "');"
			end
			txt.close

			js.puts "\tsetMotd();"
			js.puts "\tsetTitle();"
			js.puts "});"

			js.puts "function setMotd() {"
			js.puts "\tvar index = Math.floor((Math.random() * motdArr.length));"
			js.puts "\t$('#motd').html('&#12300; ' + motdArr[index] + ' &#12301;');"
			js.puts "}"

			js.puts "function setTitle() {"
			js.puts "\tvar index = Math.floor((Math.random() * titleArr.length));"
			js.puts "\tdocument.title = document.title + ' - ' + titleArr[index];"
			js.puts "}"

			js.close

			puts js
		end
	end

end
