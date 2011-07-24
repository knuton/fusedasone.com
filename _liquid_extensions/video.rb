class Video < Liquid::Block                                             
  SERVICES = {
    'vimeo'   => 'Vimeo',
    'youtube' => 'YouTube'
  }

  def initialize(tag_name, service, tokens)
     super 
     @service = service.strip
  end

  def render(context)
    url = super.to_s.strip
    return self.send(@service, url) +
      %!<a href="#{url}" class="directlink">#{SERVICES[@service]}-Link</a>!
  end    

  def youtube(url)
    if url =~ /.+v=(.{11}).*/
      token = $1
    else
      raise ArgumentError.new("Not a valid YouTube URL!")
    end
    '<object width="480" height="350" class="adjust"><param name="movie" value="http://www.youtube-nocookie.com/v/TOKEN&amp;fs=1&amp;rel=0"></param><param name="allowFullScreen" value="true"></param><param name="allowscriptaccess" value="always"></param><embed src="http://www.youtube-nocookie.com/v/TOKEN&amp;fs=1&rel=0" type="application/x-shockwave-flash" allowscriptaccess="always" allowfullscreen="true" width="480" height="350"></embed></object>'.gsub(/TOKEN/, token)
  end

  def vimeo(url)
    if url =~ /.+([0-9]{7}).*/
      token = $1
    else
      raise ArgumentError.new("Not a valid Vimeo URL!")
    end
    '<object width="640" height="360" class="adjust"><param name="allowfullscreen" value="true"></param><param name="allowscriptaccess" value="always"></param><param name="movie" value="http://vimeo.com/moogaloop.swf?clip_id=TOKEN&amp;server=vimeo.com&amp;show_title=1&amp;show_byline=1&amp;show_portrait=1&amp;color=FF7700&amp;fullscreen=1"></param><embed src="http://vimeo.com/moogaloop.swf?clip_id=TOKEN&amp;server=vimeo.com&amp;show_title=1&amp;show_byline=1&amp;show_portrait=1&amp;color=FF7700&amp;fullscreen=1" type="application/x-shockwave-flash" allowfullscreen="true" allowscriptaccess="always" width="640" height="360"></embed></object>'.gsub(/TOKEN/, token)
  end
end

Liquid::Template.register_tag('video', Video)
