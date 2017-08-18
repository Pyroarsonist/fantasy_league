require 'open-uri'
require 'nokogiri'
require 'json'
class Core
  url='https://www.hltv.org/stats/matches/46907/complexity-vs-rise-nation'
  @doc = Nokogiri::HTML(open(url))
  players = []

  def self.parse_team(ifLeft)
    isLeft=ifLeft ? 'left' : 'right'
    css_sel=".team-#{isLeft} a"
    t_text=@doc.css(css_sel)[0].text
    t_id = @doc.css(css_sel)[0]['href'].to_s.split('/')[3]
    [t_text, t_id] # id and name of Team
  end

  def self.parse_player(index)
    player=@doc.css('.st-player a')[index]
    pl_name = player.text
    pl_id=player['href'].to_s.split('/')[3]
    [pl_name, pl_id]
  end

  def self.parse_kills(index)
    index=index.next
    index=index.next if index>=6
    k_css=@doc.css('.st-kills')[index]
    k_and_h = k_css.text
    arr=k_and_h.split('(')
    kills=arr[0].rstrip
    arr=arr[1].split(')')
    heads=arr[0]
    [kills, heads]
  end

  def self.parse_assists(index)
    index=index.next
    index=index.next if index>=6
    a_css=@doc.css('.st-assists')[index]
    a = a_css.text
    a
  end

  def self.parse_deaths(index)
    index=index.next
    index=index.next if index>=6
    d_css=@doc.css('.st-deaths')[index]
    d = d_css.text
    d
  end

  def self.parse_kast(index)
    index=index.next
    index=index.next if index>=6
    kast_css=@doc.css('.st-kdratio')[index]
    kast = kast_css.text
    kast
  end

  def self.parse_adr(index)
    index=index.next
    index=index.next if index>=6
    adr_css=@doc.css('.st-adr')[index]
    adr = adr_css.text
    adr
  end

  def self.parse_fk_diff(index)
    index=index.next
    index=index.next if index>=6
    fk_diff_css=@doc.css('.st-fkdiff')[index]
    fk_diff = fk_diff_css.text
    fk_diff
  end


  counter=0
  @doc.css('.st-player a').each do |player|
    pl_team= parse_team(counter < 5)
    pl_name=parse_player(counter)
    k_and_h= parse_kills(counter)
    a=parse_assists(counter)
    d=parse_deaths(counter)
    kast=parse_kast(counter)
    adr=parse_adr(counter)
    fk_diff= parse_fk_diff(counter)


    counter=counter.next

    players.push(
        name: pl_name[0],
        name_id: pl_name[1],
        team: pl_team[0],
        team_id: pl_team[1],
        kills: k_and_h[0],
        heads: k_and_h[1],
        assists: a,
        deaths: d,
        kast: kast,
        adr: adr,
        fk_diff: fk_diff
    )
  end

  puts JSON.pretty_generate(players)
end