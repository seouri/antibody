species = [
  [6329, 'nematode', 'Caenorhabditis elegans'],
  [7227, 'fruit fly', 'Drosophila melanogaster'],
  [9031, 'chicken', 'Gallus gallus'],
  [9606, 'human', 'Homo sapiens'],
  [9925, 'goat', 'Capra hircus'],
  [9986, 'rabbit', 'Oryctolagus cuniculus'],
  [10090, 'mouse', 'Mus musculus'],
  [10116, 'rat', 'Rattus norvegicus'],
  [10141, 'guinea pig', 'Cavia porcellus']
]

species.each do |s|
  ns = Species.new(:name => s[1], :scientific_name => s[2])
  ns.id = s[0]
  ns.save!
end
