UserQuestion.destroy_all
User.destroy_all
Match.destroy_all

Person.destroy_all
mathematician = Person.create(name: "Mathematician")
physicist = Person.create(name: "Physicist")
chemist = Person.create(name: "Chemist")
politician = Person.create(name: "Politician")

Question.destroy_all

math = [Question.create(question: "Which of the following cannot be formed from conic sections?", option_a: "circle", option_b: "ellipse", option_c: "hyperbola", option_d: "parabola", answer: "parallelogram"),
Question.create(question: "What is the limit as x approaches infinity of 1/x?", option_a: "none of any of these", option_b: "negative infinity", option_c: "infinity", option_d: "1", answer: "0"),
Question.create(question: "What is the locus of points equidistant from two given points?", option_a: "circle", option_b: "triangle", option_c: "square", option_d: "parallelogram, not a square", answer: "ellipse, not a circle"),
Question.create(question: "The inverse of secant is...", option_a: "cosecant", option_b: "sine", option_c: "tangent", option_d: "cotangent", answer: "cosine"),
Question.create(question: "Which of the following three sides (in cm) cannot form a triangle?", option_a: "3, 4, 5", option_b: "7, 8, 12", option_c: "4, 4, 4", option_d: "1, 2, 2", answer: "5, 6, 13"),
Question.create(question: "Which equation best represents a circle on an x-y coordinate system, where r is the radius?", option_a: "none of any of these", option_b: "(x + y)^2 = r^2", option_c: "y^2 - x^2 = r^2", option_d: "x^2 - y^2 = r^2", answer: "x^2 + y^2 = r^2"),
Question.create(question: "Where do we use the method of least squares?", option_a: "trigonometry", option_b: "solving derivatives in calculus", option_c: "solving quadratic equations", option_d: "none of any of these", answer: "linear regression"),
Question.create(question: "Which of the following statements about natural logarithms is false?", option_a: "ln(a*b) = ln(a) + ln(b)", option_b: "ln(e) = 1", option_c: "ln(a^b) = b * ln(a)", option_d: "all of these are true", answer: "ln(b/a) = ln(a) - ln(b)"),
Question.create(question: "What is the slope of the following line on the x-y coordinate system? y = 2x + 3", option_a: "2/3", option_b: "3/2", option_c: "x", option_d: "y", answer: "2"),
Question.create(question: "Given a hypotenuse of 13 cm and another side of 5 cm, what is the length of the remaining side of this right triangle?", option_a: "10 cm", option_b: "5 cm", option_c: "13 cm", option_d: "14 cm", answer: "none of any of these")]


physics = [Question.create(question: "What is the free fall acceleration due to gravity for earth in m/s^2?", option_a: "7.35", option_b: "2.55", option_c: "3.14", option_d: "1.50", answer: "9.81"),
Question.create(question: "Which statement describes the gravitational force and the electrostatic force between two charged particles?", option_a: "Both forces may be either attractive or repulsive.", option_b: "Both forces must be attractive.", option_c: "The gravitational force may be either attractive or repulsive, whereas the electrostatic force must be attractive", option_d: "None of any of these", answer: "The gravitational force must be attractive, whereas the electrostatic force may be either attractive or repulsive. "),
Question.create(question: "An observer counts 4 complete water waves passing by the end of a dock every 10. seconds. What is the frequency of the waves?", option_a: "25 Hz", option_b: "2.5 Hz", option_c: "4.0 Hz", option_d: "40 Hz", answer: "0.40 Hz"),
Question.create(question: "Glass may shatter when exposed to sound of a particular frequency. This phenomenon is an example of ", option_a: "diffraction", option_b: "refraction", option_c: "the Doppler effect", option_d: "buoyancy", answer: "resonance"),
Question.create(question: "Which waves require a material medium for transmission?", option_a: "light waves", option_b: "radio waves", option_c: "microwaves", option_d: "UV waves", answer: "sound waves"),
Question.create(question: "Which type of oscillation would most likely produce an electromagnetic wave?", option_a: "none of any of these", option_b: "a vibrating tuning fork", option_c: "a washing machine agitator at work", option_d: "a swinging pendulum", answer: "an electron traveling back and forth in a wire"),
Question.create(question: "If monochromatic light passes from water into air with an angle of incidence of 35°, which characteristic of the light will remain the same?", option_a: "None of any of these", option_b: "direction", option_c: "wavelength", option_d: "speed", answer: "frequency"),
Question.create(question: "When a wave travels through a medium, the wave transfers", option_a: "mass, only", option_b: "waves cannot travel through mediums", option_c: "both mass and energy", option_d: "neither mass nor energy", answer: "energy, only"),
Question.create(question: "A rubber block weighing 60. newtons is resting on a horizontal surface of dry asphalt. What is the magnitude of the minimum force needed to start the rubber block moving across the dry asphalt?", option_a: "60 N", option_b: "32 N", option_c: "40 N", option_d: "50 N", answer: "51 N"),
Question.create(question: "If a block is in equilibrium, the magnitude of the block’s acceleration is", option_a: "cannot be calculated from this data alone", option_b: "constant, but not zero", option_c: "increasing", option_d: "decreasing", answer: "zero"),
Question.create(question: "A unit used for a vector quantity is", option_a: "second", option_b: "kilogram", option_c: "watt", option_d: "joule", answer: "newton")]


chemistry = [Question.create(question: "What is a titration?", option_a: "When solid turns to gas directly", option_b: "Creating covalent bonds", option_c: "Destroying covalent bonds", option_d: "Pairing protons and electrons against each other", answer: "Neutralizing Acids and Bases with each other"),
Question.create(question: "What is sublimation?", option_a: "Neutralizing Acids and Bases with each other", option_b: "Creating covalent bonds", option_c: "Destroying covalent bonds", option_d: "Pairing protons and electrons against each other", answer: "When solid turns to gas directly"),
Question.create(question: "Which of the following are valid atomic weights (in AMU) of Boron?", option_a: "2 & 3", option_b: "5 & 6", option_c: "50 & 51", option_d: "0 & 1", answer: "10 & 11"),
Question.create(question: "What type of bond forms between the H and Cl in HCl?", option_a: "Hydrogen Bond", option_b: "Electronic Bond", option_c: "Isotopic Bond", option_d: "Chloride Bond", answer: "Covalent Bond"),
Question.create(question: "What weighs more than the other?", option_a: "Proton", option_b: "Boson", option_c: "Lepton", option_d: "Electron", answer: "Neutron"),
Question.create(question: "Which of the following sugars are not related to the others?", option_a: "Glucose", option_b: "Fructose", option_c: "Galactose", option_d: "A Monosaccharide", answer: "Dextrose"),
Question.create(question: "The entropy is of the universe is...", option_a: "decreasing", option_b: "tangible only as a liquid", option_c: "constant", option_d: "tangible only as a solid", answer: "always increasing"),
Question.create(question: "6CO2 + 6H2O + energy => C6H12O6 + 6O2 is an equation of what?", option_a: "Hydrocarbon Reuse", option_b: "Diesel Engine Combustion", option_c: "Respiration in Humans", option_d: "Igneous Rock Formation", answer: "Photosynthesis"),
Question.create(question: "An SN2 is an example of a...", option_a: "Atomic Splitting", option_b: "Oxidation-Reduction Reactions of Metal", option_c: "Nuclear Fission", option_d: "Nuclear Fusion", answer: "Nucleophilic Substitution"),
Question.create(question: "What is the ratio of oxygen atoms to carbon atoms in Monosaccharides?", option_a: "1:2", option_b: "2:1", option_c: "1:3", option_d: "3:1", answer: "1:1"),
Question.create(question: "Where T represents temperature, delta H represents enthalpy, and delta S represents entropy, Gibbs Free Energy (delta G) can be calculated using:", option_a: "delta G = delta H + delta S", option_b: "delta G = (T * delta H) + delta S", option_c: "delta G = (T * delta H) - delta S", option_d: "delta G = delta H + (T * delta S)", answer: "delta G = delta H - (T * delta S)")]

history = [Question.create(question: "Which Chinese dynasty came before the others?", option_a: "Han Dyansty", option_b: "Sui Dynasty", option_c: "Tang Dynasty", option_d: "Ming Dynasty", answer: "Qin Dynasty"),
Question.create(question: "Who was considered the leader of the Menshevik faction of the USSR Communists?", option_a: "John Oliver", option_b: "Nikita Khrushchev", option_c: "Vladimir Lenin", option_d: "Josef Stalin", answer: "Leon Trotsky"),
Question.create(question: "Who was the fourth President of the United States?", option_a: "James Monroe", option_b: "Andrew Jackson", option_c: "Martin Van Buren", option_d: "Alexander Hamilton", answer: "James Madison"),
Question.create(question: "Which of the following Empires fell last?", option_a: "Zhou", option_b: "Siam", option_c: "Rome", option_d: "Srivijaya", answer: "Majapahit"),
Question.create(question: "Which of the following countries was ruled by a Shogun?", option_a: "China", option_b: "Korea", option_c: "Thailand", option_d: "Laos", answer: "Japan"),
Question.create(question: "Where is the Crimea located?", option_a: "East Asia", option_b: "Subsaharan Africa", option_c: "Latin America", option_d: "It doesn't", answer: "Eastern Europe"),
Question.create(question: "Alaska was sold to the United States from which country?", option_a: "England", option_b: "Netherlands", option_c: "Canada", option_d: "It wasn't", answer: "Russia"),
Question.create(question: "The Hohenzollerns primarily ruled what country?", option_a: "Serbia", option_b: "Hungary", option_c: "Denmark", option_d: "Scotland", answer: "Prussia"),
Question.create(question: "Where was the Taj Mahal constructed?", option_a: "Delhi", option_b: "Jaipur", option_c: "Mumbai", option_d: "Culcutta", answer: "Agra"),
Question.create(question: "What is Otto von Bismarck most famous for?", option_a: "Defeating Russia during WWI", option_b: "Inventing the gas powered engine", option_c: "He isn't", option_d: "First German explorer in the Americas", answer: "Unifying Germany")]

math.each {|question| mathematician.questions << question}
physics.each {|question| physicist.questions << question}
chemistry.each {|question| chemist.questions << question}
history.each {|question| politician.questions << question}
