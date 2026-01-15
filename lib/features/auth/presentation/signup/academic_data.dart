const programTypes = ['Diploma', 'Undergraduate'];

const faculties = {
  'ABU Business School': [
    'Accounting',
    'Insurance',
    'Banking and Finance',
    'Business Administration',
    'Business Management',
    'Economics',
    'Marketing',
    'Actuarial Science and Insurance',
  ],
  'Administration': [
    'Public Administration',
    'Local Government and Development Studies',
  ],
  'Agriculture': [
    'Agricultural Extension and Rural Development',
    'Forestry and Wildlife',
    'Fisheries',
    'Agricultural Economics',
  ],
  'Allied Health Sciences': [
    'Medical Laboratory Science',
    'Medical Radiography',
    'Nursing Science',
  ],
  'Arts': [
    'Arabic',
    'Archaeology',
    'Theatre and Performing Arts',
    'English',
    'French',
    'African Languages and Cultures',
    'History',
  ],
  'Basic Clinical Sciences': [],
  'Basic Medical Sciences': ['Human Anatomy', 'Human Physiology'],
  'Clinical Sciences': [
    'Dental Surgery',
    'Chemical Pathology',
    'Haematology and Blood Transfusion',
    'Community Medicine',
    'Medicine',
    'Pathology (Morbid Anatomy)',
    'Obstetrics and Gynecology',
  ],
  'Dental Surgery': [],
  'Education': [
    'Science Education',
    'Arts and Social Science Education',
    'Educational Foundation and Curriculum',
    'Educational Psychology and Counselling',
    'Home Economics',
    'Vocational and Technical Education',
    'Physical and Health Education',
    'Human Kinetics and Health Education',
    'Library and Information Science',
  ],
  'Engineering': [
    'Metallurgical and Materials Engineering',
    'Mechanical Engineering',
    'Chemical Engineering',
    'Civil Engineering',
    'Computer Engineering',
    'Electronics & Telecommunication Engineering',
    'Polymer & Textile Engineering',
    'Water Resources & Environmental Engineering',
    'Agricultural Engineering',
    'Mechatronics Engineering',
    'Automotive Engineering',
  ],
  'Environmental Design': [
    'Urban and Regional Planning',
    'Fine Arts',
    'Industrial Design',
    'Geomatics',
    'Glass and Silicate Technology',
    'Architecture',
    'Building',
  ],
  'Law': [
    'Civil Law',
    'Islamic Law',
    'Commercial Law',
    'Private Law',
    'Public Law',
  ],
  'Life Sciences': [
    'Biochemistry',
    'Biological Sciences',
    'Botany',
    'Microbiology',
    'Zoology',
  ],
  'Management Sciences': [],
  'Pharmacy': [
    'Pharmacy',
    'Clinical Pharmacy & Pharmacy Practice',
    'Pharmaceutical and Medicinal Chemistry',
    'Pharmaceutics and Pharmaceutical Microbiology',
    'Pharmacognosy and Drug Development',
    'Pharmacology and Clinical Pharmacy',
  ],
  'Physical Sciences': [
    'Geography and Environmental Management',
    'Chemistry',
    'Computer Science',
    'Geology',
    'Mathematics',
    'Physics',
    'Polymer and Textile Engineering',
    'Statistics',
  ],
  'Social Sciences': [
    'Political Science',
    'Mass Communication',
    'Sociology',
    'Economics',
  ],
  'Veterinary Medicine': [
    'Veterinary Medicine',
    'Veterinary Surgery and Radiology',
    'Theriogenology and Production',
    'Veterinary Public Health and Preventive Medicine',
    'Veterinary Anatomy',
    'Veterinary Parasitology and Entomology',
    'Veterinary Microbiology',
    'Veterinary Pathology',
    'Veterinary Pharmacology and Toxicology',
    'Veterinary Physiology',
  ],
};

const levels = ['100', '200', '300', '400', '500', '600'];
const semesters = ['First Semester', 'Second Semester'];

const mockCourses = {
  // ENGINEERING FACULTY
  'Computer Engineering': {
    '100': {
      'First Semester': ['COE 101', 'MATH 101'],
      'Second Semester': ['COE 102', 'PHYS 101'],
    },
    '200': {
      'First Semester': ['COE 201', 'COE 202'],
      'Second Semester': ['COE 203', 'COE 204'],
    },
    '300': {
      'First Semester': ['COE 301', 'COE 302'],
      'Second Semester': ['COE 303', 'COE 304'],
    },
    '400': {
      'First Semester': ['COE 401', 'COE 402'],
      'Second Semester': ['COE 403', 'COE 404'],
    },
    '500': {
      'First Semester': ['COE 501', 'COE 502'],
      'Second Semester': ['COE 503', 'COE 504'],
    },
  },
  'Civil Engineering': {
    '100': {
      'First Semester': ['CVE 101', 'MATH 101'],
      'Second Semester': ['CVE 102', 'PHYS 101'],
    },
    '200': {
      'First Semester': ['CVE 201', 'CVE 202'],
      'Second Semester': ['CVE 203', 'CVE 204'],
    },
    '300': {
      'First Semester': ['CVE 301', 'CVE 302'],
      'Second Semester': ['CVE 303', 'CVE 304'],
    },
    '400': {
      'First Semester': ['CVE 401', 'CVE 402'],
      'Second Semester': ['CVE 403', 'CVE 404'],
    },
    '500': {
      'First Semester': ['CVE 501', 'CVE 502'],
      'Second Semester': ['CVE 503', 'CVE 504'],
    },
  },
  'Mechanical Engineering': {
    '100': {
      'First Semester': ['MEE 101', 'MATH 101'],
      'Second Semester': ['MEE 102', 'PHYS 101'],
    },
    '200': {
      'First Semester': ['MEE 201', 'MEE 202'],
      'Second Semester': ['MEE 203', 'MEE 204'],
    },
    '300': {
      'First Semester': ['MEE 301', 'MEE 302'],
      'Second Semester': ['MEE 303', 'MEE 304'],
    },
    '400': {
      'First Semester': ['MEE 401', 'MEE 402'],
      'Second Semester': ['MEE 403', 'MEE 404'],
    },
    '500': {
      'First Semester': ['MEE 501', 'MEE 502'],
      'Second Semester': ['MEE 503', 'MEE 504'],
    },
  },
  'Electrical Engineering': {
    '100': {
      'First Semester': ['EEE 101', 'MATH 101'],
      'Second Semester': ['EEE 102', 'PHYS 101'],
    },
    '200': {
      'First Semester': ['EEE 201', 'EEE 202'],
      'Second Semester': ['EEE 203', 'EEE 204'],
    },
    '300': {
      'First Semester': ['EEE 301', 'EEE 302'],
      'Second Semester': ['EEE 303', 'EEE 304'],
    },
    '400': {
      'First Semester': ['EEE 401', 'EEE 402'],
      'Second Semester': ['EEE 403', 'EEE 404'],
    },
    '500': {
      'First Semester': ['EEE 501', 'EEE 502'],
      'Second Semester': ['EEE 503', 'EEE 504'],
    },
  },
  'Chemical Engineering': {
    '100': {
      'First Semester': ['CHE 101', 'MATH 101'],
      'Second Semester': ['CHE 102', 'PHYS 101'],
    },
    '200': {
      'First Semester': ['CHE 201', 'CHE 202'],
      'Second Semester': ['CHE 203', 'CHE 204'],
    },
    '300': {
      'First Semester': ['CHE 301', 'CHE 302'],
      'Second Semester': ['CHE 303', 'CHE 304'],
    },
    '400': {
      'First Semester': ['CHE 401', 'CHE 402'],
      'Second Semester': ['CHE 403', 'CHE 404'],
    },
    '500': {
      'First Semester': ['CHE 501', 'CHE 502'],
      'Second Semester': ['CHE 503', 'CHE 504'],
    },
  },
  'Agricultural Engineering': {
    '100': {
      'First Semester': ['AGE 101', 'MATH 101'],
      'Second Semester': ['AGE 102', 'PHYS 101'],
    },
    '200': {
      'First Semester': ['AGE 201', 'AGE 202'],
      'Second Semester': ['AGE 203', 'AGE 204'],
    },
    '300': {
      'First Semester': ['AGE 301', 'AGE 302'],
      'Second Semester': ['AGE 303', 'AGE 304'],
    },
    '400': {
      'First Semester': ['AGE 401', 'AGE 402'],
      'Second Semester': ['AGE 403', 'AGE 404'],
    },
    '500': {
      'First Semester': ['AGE 501', 'AGE 502'],
      'Second Semester': ['AGE 503', 'AGE 504'],
    },
  },
  'Metallurgical and Materials Engineering': {
    '100': {
      'First Semester': ['MME 101', 'MATH 101'],
      'Second Semester': ['MME 102', 'PHYS 101'],
    },
    '200': {
      'First Semester': ['MME 201', 'MME 202'],
      'Second Semester': ['MME 203', 'MME 204'],
    },
    '300': {
      'First Semester': ['MME 301', 'MME 302'],
      'Second Semester': ['MME 303', 'MME 304'],
    },
    '400': {
      'First Semester': ['MME 401', 'MME 402'],
      'Second Semester': ['MME 403', 'MME 404'],
    },
    '500': {
      'First Semester': ['MME 501', 'MME 502'],
      'Second Semester': ['MME 503', 'MME 504'],
    },
  },
  'Electronics & Telecommunication Engineering': {
    '100': {
      'First Semester': ['ETE 101', 'MATH 101'],
      'Second Semester': ['ETE 102', 'PHYS 101'],
    },
    '200': {
      'First Semester': ['ETE 201', 'ETE 202'],
      'Second Semester': ['ETE 203', 'ETE 204'],
    },
    '300': {
      'First Semester': ['ETE 301', 'ETE 302'],
      'Second Semester': ['ETE 303', 'ETE 304'],
    },
    '400': {
      'First Semester': ['ETE 401', 'ETE 402'],
      'Second Semester': ['ETE 403', 'ETE 404'],
    },
    '500': {
      'First Semester': ['ETE 501', 'ETE 502'],
      'Second Semester': ['ETE 503', 'ETE 504'],
    },
  },
  'Polymer & Textile Engineering': {
    '100': {
      'First Semester': ['PTE 101', 'MATH 101'],
      'Second Semester': ['PTE 102', 'PHYS 101'],
    },
    '200': {
      'First Semester': ['PTE 201', 'PTE 202'],
      'Second Semester': ['PTE 203', 'PTE 204'],
    },
    '300': {
      'First Semester': ['PTE 301', 'PTE 302'],
      'Second Semester': ['PTE 303', 'PTE 304'],
    },
    '400': {
      'First Semester': ['PTE 401', 'PTE 402'],
      'Second Semester': ['PTE 403', 'PTE 404'],
    },
    '500': {
      'First Semester': ['PTE 501', 'PTE 502'],
      'Second Semester': ['PTE 503', 'PTE 504'],
    },
  },
  'Water Resources & Environmental Engineering': {
    '100': {
      'First Semester': ['WRE 101', 'MATH 101'],
      'Second Semester': ['WRE 102', 'PHYS 101'],
    },
    '200': {
      'First Semester': ['WRE 201', 'WRE 202'],
      'Second Semester': ['WRE 203', 'WRE 204'],
    },
    '300': {
      'First Semester': ['WRE 301', 'WRE 302'],
      'Second Semester': ['WRE 303', 'WRE 304'],
    },
    '400': {
      'First Semester': ['WRE 401', 'WRE 402'],
      'Second Semester': ['WRE 403', 'WRE 404'],
    },
    '500': {
      'First Semester': ['WRE 501', 'WRE 502'],
      'Second Semester': ['WRE 503', 'WRE 504'],
    },
  },
  'Mechatronics Engineering': {
    '100': {
      'First Semester': ['MCT 101', 'MATH 101'],
      'Second Semester': ['MCT 102', 'PHYS 101'],
    },
    '200': {
      'First Semester': ['MCT 201', 'MCT 202'],
      'Second Semester': ['MCT 203', 'MCT 204'],
    },
    '300': {
      'First Semester': ['MCT 301', 'MCT 302'],
      'Second Semester': ['MCT 303', 'MCT 304'],
    },
    '400': {
      'First Semester': ['MCT 401', 'MCT 402'],
      'Second Semester': ['MCT 403', 'MCT 404'],
    },
    '500': {
      'First Semester': ['MCT 501', 'MCT 502'],
      'Second Semester': ['MCT 503', 'MCT 504'],
    },
  },
  'Automotive Engineering': {
    '100': {
      'First Semester': ['AUT 101', 'MATH 101'],
      'Second Semester': ['AUT 102', 'PHYS 101'],
    },
    '200': {
      'First Semester': ['AUT 201', 'AUT 202'],
      'Second Semester': ['AUT 203', 'AUT 204'],
    },
    '300': {
      'First Semester': ['AUT 301', 'AUT 302'],
      'Second Semester': ['AUT 303', 'AUT 304'],
    },
    '400': {
      'First Semester': ['AUT 401', 'AUT 402'],
      'Second Semester': ['AUT 403', 'AUT 404'],
    },
    '500': {
      'First Semester': ['AUT 501', 'AUT 502'],
      'Second Semester': ['AUT 503', 'AUT 504'],
    },
  },

  // PHYSICAL SCIENCES FACULTY
  'Computer Science': {
    '100': {
      'First Semester': ['CSC 101', 'CSC 102'],
      'Second Semester': ['CSC 103', 'CSC 104'],
    },
    '200': {
      'First Semester': ['CSC 201', 'CSC 202'],
      'Second Semester': ['CSC 203', 'CSC 204'],
    },
    '300': {
      'First Semester': ['CSC 301', 'CSC 302'],
      'Second Semester': ['CSC 303', 'CSC 304'],
    },
    '400': {
      'First Semester': ['CSC 401', 'CSC 402'],
      'Second Semester': ['CSC 403', 'CSC 404'],
    },
  },
  'Mathematics': {
    '100': {
      'First Semester': ['MTH 101', 'MTH 102'],
      'Second Semester': ['MTH 103', 'MTH 104'],
    },
    '200': {
      'First Semester': ['MTH 201', 'MTH 202'],
      'Second Semester': ['MTH 203', 'MTH 204'],
    },
    '300': {
      'First Semester': ['MTH 301', 'MTH 302'],
      'Second Semester': ['MTH 303', 'MTH 304'],
    },
    '400': {
      'First Semester': ['MTH 401', 'MTH 402'],
      'Second Semester': ['MTH 403', 'MTH 404'],
    },
  },
  'Physics': {
    '100': {
      'First Semester': ['PHY 101', 'PHY 102'],
      'Second Semester': ['PHY 103', 'PHY 104'],
    },
    '200': {
      'First Semester': ['PHY 201', 'PHY 202'],
      'Second Semester': ['PHY 203', 'PHY 204'],
    },
    '300': {
      'First Semester': ['PHY 301', 'PHY 302'],
      'Second Semester': ['PHY 303', 'PHY 304'],
    },
    '400': {
      'First Semester': ['PHY 401', 'PHY 402'],
      'Second Semester': ['PHY 403', 'PHY 404'],
    },
  },
  'Chemistry': {
    '100': {
      'First Semester': ['CHM 101', 'CHM 102'],
      'Second Semester': ['CHM 103', 'CHM 104'],
    },
    '200': {
      'First Semester': ['CHM 201', 'CHM 202'],
      'Second Semester': ['CHM 203', 'CHM 204'],
    },
    '300': {
      'First Semester': ['CHM 301', 'CHM 302'],
      'Second Semester': ['CHM 303', 'CHM 304'],
    },
    '400': {
      'First Semester': ['CHM 401', 'CHM 402'],
      'Second Semester': ['CHM 403', 'CHM 404'],
    },
  },
  'Geography and Environmental Management': {
    '100': {
      'First Semester': ['GEM 101', 'GEM 102'],
      'Second Semester': ['GEM 103', 'GEM 104'],
    },
    '200': {
      'First Semester': ['GEM 201', 'GEM 202'],
      'Second Semester': ['GEM 203', 'GEM 204'],
    },
    '300': {
      'First Semester': ['GEM 301', 'GEM 302'],
      'Second Semester': ['GEM 303', 'GEM 304'],
    },
    '400': {
      'First Semester': ['GEM 401', 'GEM 402'],
      'Second Semester': ['GEM 403', 'GEM 404'],
    },
  },
  'Polymer and Textile Engineering': {
    // For Physical Sciences (distinct key from Engineering's "Polymer & Textile")
    '100': {
      'First Semester': ['PTE 101', 'MATH 101'],
      'Second Semester': ['PTE 102', 'PHYS 101'],
    },
    '200': {
      'First Semester': ['PTE 201', 'PTE 202'],
      'Second Semester': ['PTE 203', 'PTE 204'],
    },
    '300': {
      'First Semester': ['PTE 301', 'PTE 302'],
      'Second Semester': ['PTE 303', 'PTE 304'],
    },
    '400': {
      'First Semester': ['PTE 401', 'PTE 402'],
      'Second Semester': ['PTE 403', 'PTE 404'],
    },
    '500': {
      'First Semester': ['PTE 501', 'PTE 502'],
      'Second Semester': ['PTE 503', 'PTE 504'],
    },
  },
  'Statistics': {
    '100': {
      'First Semester': ['STA 101', 'STA 102'],
      'Second Semester': ['STA 103', 'STA 104'],
    },
    '200': {
      'First Semester': ['STA 201', 'STA 202'],
      'Second Semester': ['STA 203', 'STA 204'],
    },
    '300': {
      'First Semester': ['STA 301', 'STA 302'],
      'Second Semester': ['STA 303', 'STA 304'],
    },
    '400': {
      'First Semester': ['STA 401', 'STA 402'],
      'Second Semester': ['STA 403', 'STA 404'],
    },
  },
  'Geology': {
    '100': {
      'First Semester': ['GEO 101', 'GEO 102'],
      'Second Semester': ['GEO 103', 'GEO 104'],
    },
    '200': {
      'First Semester': ['GEO 201', 'GEO 202'],
      'Second Semester': ['GEO 203', 'GEO 204'],
    },
    '300': {
      'First Semester': ['GEO 301', 'GEO 302'],
      'Second Semester': ['GEO 303', 'GEO 304'],
    },
    '400': {
      'First Semester': ['GEO 401', 'GEO 402'],
      'Second Semester': ['GEO 403', 'GEO 404'],
    },
  },

  // SOCIAL SCIENCES FACULTY
  'Economics': {
    '100': {
      'First Semester': ['ECO 101', 'ECO 102'],
      'Second Semester': ['ECO 103', 'ECO 104'],
    },
    '200': {
      'First Semester': ['ECO 201', 'ECO 202'],
      'Second Semester': ['ECO 203', 'ECO 204'],
    },
    '300': {
      'First Semester': ['ECO 301', 'ECO 302'],
      'Second Semester': ['ECO 303', 'ECO 304'],
    },
    '400': {
      'First Semester': ['ECO 401', 'ECO 402'],
      'Second Semester': ['ECO 403', 'ECO 404'],
    },
  },
  'Political Science': {
    '100': {
      'First Semester': ['POL 101', 'POL 102'],
      'Second Semester': ['POL 103', 'POL 104'],
    },
    '200': {
      'First Semester': ['POL 201', 'POL 202'],
      'Second Semester': ['POL 203', 'POL 204'],
    },
    '300': {
      'First Semester': ['POL 301', 'POL 302'],
      'Second Semester': ['POL 303', 'POL 304'],
    },
    '400': {
      'First Semester': ['POL 401', 'POL 402'],
      'Second Semester': ['POL 403', 'POL 404'],
    },
  },
  'Sociology': {
    '100': {
      'First Semester': ['SOC 101', 'SOC 102'],
      'Second Semester': ['SOC 103', 'SOC 104'],
    },
    '200': {
      'First Semester': ['SOC 201', 'SOC 202'],
      'Second Semester': ['SOC 203', 'SOC 204'],
    },
    '300': {
      'First Semester': ['SOC 301', 'SOC 302'],
      'Second Semester': ['SOC 303', 'SOC 304'],
    },
    '400': {
      'First Semester': ['SOC 401', 'SOC 402'],
      'Second Semester': ['SOC 403', 'SOC 404'],
    },
  },
  'Mass Communication': {
    '100': {
      'First Semester': ['MCM 101', 'MCM 102'],
      'Second Semester': ['MCM 103', 'MCM 104'],
    },
    '200': {
      'First Semester': ['MCM 201', 'MCM 202'],
      'Second Semester': ['MCM 203', 'MCM 204'],
    },
    '300': {
      'First Semester': ['MCM 301', 'MCM 302'],
      'Second Semester': ['MCM 303', 'MCM 304'],
    },
    '400': {
      'First Semester': ['MCM 401', 'MCM 402'],
      'Second Semester': ['MCM 403', 'MCM 404'],
    },
  },

  // ABU BUSINESS SCHOOL
  'Accounting': {
    '100': {
      'First Semester': ['ACC 101', 'ACC 102'],
      'Second Semester': ['ACC 103', 'ACC 104'],
    },
    '200': {
      'First Semester': ['ACC 201', 'ACC 202'],
      'Second Semester': ['ACC 203', 'ACC 204'],
    },
    '300': {
      'First Semester': ['ACC 301', 'ACC 302'],
      'Second Semester': ['ACC 303', 'ACC 304'],
    },
    '400': {
      'First Semester': ['ACC 401', 'ACC 402'],
      'Second Semester': ['ACC 403', 'ACC 404'],
    },
  },
  'Banking and Finance': {
    '100': {
      'First Semester': ['BNF 101', 'BNF 102'],
      'Second Semester': ['BNF 103', 'BNF 104'],
    },
    '200': {
      'First Semester': ['BNF 201', 'BNF 202'],
      'Second Semester': ['BNF 203', 'BNF 204'],
    },
    '300': {
      'First Semester': ['BNF 301', 'BNF 302'],
      'Second Semester': ['BNF 303', 'BNF 304'],
    },
    '400': {
      'First Semester': ['BNF 401', 'BNF 402'],
      'Second Semester': ['BNF 403', 'BNF 404'],
    },
  },
  'Business Administration': {
    '100': {
      'First Semester': ['BUS 101', 'BUS 102'],
      'Second Semester': ['BUS 103', 'BUS 104'],
    },
    '200': {
      'First Semester': ['BUS 201', 'BUS 202'],
      'Second Semester': ['BUS 203', 'BUS 204'],
    },
    '300': {
      'First Semester': ['BUS 301', 'BUS 302'],
      'Second Semester': ['BUS 303', 'BUS 304'],
    },
    '400': {
      'First Semester': ['BUS 401', 'BUS 402'],
      'Second Semester': ['BUS 403', 'BUS 404'],
    },
  },
  'Marketing': {
    '100': {
      'First Semester': ['MKT 101', 'MKT 102'],
      'Second Semester': ['MKT 103', 'MKT 104'],
    },
    '200': {
      'First Semester': ['MKT 201', 'MKT 202'],
      'Second Semester': ['MKT 203', 'MKT 204'],
    },
    '300': {
      'First Semester': ['MKT 301', 'MKT 302'],
      'Second Semester': ['MKT 303', 'MKT 304'],
    },
    '400': {
      'First Semester': ['MKT 401', 'MKT 402'],
      'Second Semester': ['MKT 403', 'MKT 404'],
    },
  },
  'Insurance': {
    '100': {
      'First Semester': ['INS 101', 'INS 102'],
      'Second Semester': ['INS 103', 'INS 104'],
    },
    '200': {
      'First Semester': ['INS 201', 'INS 202'],
      'Second Semester': ['INS 203', 'INS 204'],
    },
    '300': {
      'First Semester': ['INS 301', 'INS 302'],
      'Second Semester': ['INS 303', 'INS 304'],
    },
    '400': {
      'First Semester': ['INS 401', 'INS 402'],
      'Second Semester': ['INS 403', 'INS 404'],
    },
  },
  'Business Management': {
    '100': {
      'First Semester': ['MGT 101', 'MGT 102'],
      'Second Semester': ['MGT 103', 'MGT 104'],
    },
    '200': {
      'First Semester': ['MGT 201', 'MGT 202'],
      'Second Semester': ['MGT 203', 'MGT 204'],
    },
    '300': {
      'First Semester': ['MGT 301', 'MGT 302'],
      'Second Semester': ['MGT 303', 'MGT 304'],
    },
    '400': {
      'First Semester': ['MGT 401', 'MGT 402'],
      'Second Semester': ['MGT 403', 'MGT 404'],
    },
  },
  'Actuarial Science and Insurance': {
    '100': {
      'First Semester': ['ASI 101', 'ASI 102'],
      'Second Semester': ['ASI 103', 'ASI 104'],
    },
    '200': {
      'First Semester': ['ASI 201', 'ASI 202'],
      'Second Semester': ['ASI 203', 'ASI 204'],
    },
    '300': {
      'First Semester': ['ASI 301', 'ASI 302'],
      'Second Semester': ['ASI 303', 'ASI 304'],
    },
    '400': {
      'First Semester': ['ASI 401', 'ASI 402'],
      'Second Semester': ['ASI 403', 'ASI 404'],
    },
  },

  // ARTS FACULTY
  'English': {
    '100': {
      'First Semester': ['ENG 101', 'ENG 102'],
      'Second Semester': ['ENG 103', 'ENG 104'],
    },
    '200': {
      'First Semester': ['ENG 201', 'ENG 202'],
      'Second Semester': ['ENG 203', 'ENG 204'],
    },
    '300': {
      'First Semester': ['ENG 301', 'ENG 302'],
      'Second Semester': ['ENG 303', 'ENG 304'],
    },
    '400': {
      'First Semester': ['ENG 401', 'ENG 402'],
      'Second Semester': ['ENG 403', 'ENG 404'],
    },
  },
  'History': {
    '100': {
      'First Semester': ['HIS 101', 'HIS 102'],
      'Second Semester': ['HIS 103', 'HIS 104'],
    },
    '200': {
      'First Semester': ['HIS 201', 'HIS 202'],
      'Second Semester': ['HIS 203', 'HIS 204'],
    },
    '300': {
      'First Semester': ['HIS 301', 'HIS 302'],
      'Second Semester': ['HIS 303', 'HIS 304'],
    },
    '400': {
      'First Semester': ['HIS 401', 'HIS 402'],
      'Second Semester': ['HIS 403', 'HIS 404'],
    },
  },
  'Arabic': {
    '100': {
      'First Semester': ['ARB 101', 'ARB 102'],
      'Second Semester': ['ARB 103', 'ARB 104'],
    },
    '200': {
      'First Semester': ['ARB 201', 'ARB 202'],
      'Second Semester': ['ARB 203', 'ARB 204'],
    },
    '300': {
      'First Semester': ['ARB 301', 'ARB 302'],
      'Second Semester': ['ARB 303', 'ARB 304'],
    },
    '400': {
      'First Semester': ['ARB 401', 'ARB 402'],
      'Second Semester': ['ARB 403', 'ARB 404'],
    },
  },

  // LIFE SCIENCES FACULTY
  'Biological Sciences': {
    '100': {
      'First Semester': ['BIO 101', 'BIO 102'],
      'Second Semester': ['BIO 103', 'BIO 104'],
    },
    '200': {
      'First Semester': ['BIO 201', 'BIO 202'],
      'Second Semester': ['BIO 203', 'BIO 204'],
    },
    '300': {
      'First Semester': ['BIO 301', 'BIO 302'],
      'Second Semester': ['BIO 303', 'BIO 304'],
    },
    '400': {
      'First Semester': ['BIO 401', 'BIO 402'],
      'Second Semester': ['BIO 403', 'BIO 404'],
    },
  },
  'Biochemistry': {
    '100': {
      'First Semester': ['BCH 101', 'BCH 102'],
      'Second Semester': ['BCH 103', 'BCH 104'],
    },
    '200': {
      'First Semester': ['BCH 201', 'BCH 202'],
      'Second Semester': ['BCH 203', 'BCH 204'],
    },
    '300': {
      'First Semester': ['BCH 301', 'BCH 302'],
      'Second Semester': ['BCH 303', 'BCH 304'],
    },
    '400': {
      'First Semester': ['BCH 401', 'BCH 402'],
      'Second Semester': ['BCH 403', 'BCH 404'],
    },
  },
  'Microbiology': {
    '100': {
      'First Semester': ['MCB 101', 'MCB 102'],
      'Second Semester': ['MCB 103', 'MCB 104'],
    },
    '200': {
      'First Semester': ['MCB 201', 'MCB 202'],
      'Second Semester': ['MCB 203', 'MCB 204'],
    },
    '300': {
      'First Semester': ['MCB 301', 'MCB 302'],
      'Second Semester': ['MCB 303', 'MCB 304'],
    },
    '400': {
      'First Semester': ['MCB 401', 'MCB 402'],
      'Second Semester': ['MCB 403', 'MCB 404'],
    },
  },

  // LAW FACULTY
  'Civil Law': {
    '100': {
      'First Semester': ['LAW 101', 'LAW 102'],
      'Second Semester': ['LAW 103', 'LAW 104'],
    },
    '200': {
      'First Semester': ['LAW 201', 'LAW 202'],
      'Second Semester': ['LAW 203', 'LAW 204'],
    },
    '300': {
      'First Semester': ['LAW 301', 'LAW 302'],
      'Second Semester': ['LAW 303', 'LAW 304'],
    },
    '400': {
      'First Semester': ['LAW 401', 'LAW 402'],
      'Second Semester': ['LAW 403', 'LAW 404'],
    },
    '500': {
      'First Semester': ['LAW 501', 'LAW 502'],
      'Second Semester': ['LAW 503', 'LAW 504'],
    },
  },

  // EDUCATION FACULTY
  'Science Education': {
    '100': {
      'First Semester': ['EDU 101', 'EDU 102'],
      'Second Semester': ['EDU 103', 'EDU 104'],
    },
    '200': {
      'First Semester': ['EDU 201', 'EDU 202'],
      'Second Semester': ['EDU 203', 'EDU 204'],
    },
    '300': {
      'First Semester': ['EDU 301', 'EDU 302'],
      'Second Semester': ['EDU 303', 'EDU 304'],
    },
    '400': {
      'First Semester': ['EDU 401', 'EDU 402'],
      'Second Semester': ['EDU 403', 'EDU 404'],
    },
  },

  // ADMINISTRATION FACULTY
  'Public Administration': {
    '100': {
      'First Semester': ['PUB 101', 'PUB 102'],
      'Second Semester': ['PUB 103', 'PUB 104'],
    },
    '200': {
      'First Semester': ['PUB 201', 'PUB 202'],
      'Second Semester': ['PUB 203', 'PUB 204'],
    },
    '300': {
      'First Semester': ['PUB 301', 'PUB 302'],
      'Second Semester': ['PUB 303', 'PUB 304'],
    },
    '400': {
      'First Semester': ['PUB 401', 'PUB 402'],
      'Second Semester': ['PUB 403', 'PUB 404'],
    },
  },
  'Local Government and Development Studies': {
    '100': {
      'First Semester': ['LGD 101', 'LGD 102'],
      'Second Semester': ['LGD 103', 'LGD 104'],
    },
    '200': {
      'First Semester': ['LGD 201', 'LGD 202'],
      'Second Semester': ['LGD 203', 'LGD 204'],
    },
    '300': {
      'First Semester': ['LGD 301', 'LGD 302'],
      'Second Semester': ['LGD 303', 'LGD 304'],
    },
    '400': {
      'First Semester': ['LGD 401', 'LGD 402'],
      'Second Semester': ['LGD 403', 'LGD 404'],
    },
  },

  // AGRICULTURE FACULTY
  'Agricultural Extension and Rural Development': {
    '100': {
      'First Semester': ['AER 101', 'AER 102'],
      'Second Semester': ['AER 103', 'AER 104'],
    },
    '200': {
      'First Semester': ['AER 201', 'AER 202'],
      'Second Semester': ['AER 203', 'AER 204'],
    },
    '300': {
      'First Semester': ['AER 301', 'AER 302'],
      'Second Semester': ['AER 303', 'AER 304'],
    },
    '400': {
      'First Semester': ['AER 401', 'AER 402'],
      'Second Semester': ['AER 403', 'AER 404'],
    },
    '500': {
      'First Semester': ['AER 501', 'AER 502'],
      'Second Semester': ['AER 503', 'AER 504'],
    },
  },
  'Forestry and Wildlife': {
    '100': {
      'First Semester': ['FOR 101', 'FOR 102'],
      'Second Semester': ['FOR 103', 'FOR 104'],
    },
    '200': {
      'First Semester': ['FOR 201', 'FOR 202'],
      'Second Semester': ['FOR 203', 'FOR 204'],
    },
    '300': {
      'First Semester': ['FOR 301', 'FOR 302'],
      'Second Semester': ['FOR 303', 'FOR 304'],
    },
    '400': {
      'First Semester': ['FOR 401', 'FOR 402'],
      'Second Semester': ['FOR 403', 'FOR 404'],
    },
    '500': {
      'First Semester': ['FOR 501', 'FOR 502'],
      'Second Semester': ['FOR 503', 'FOR 504'],
    },
  },
  'Fisheries': {
    '100': {
      'First Semester': ['FIS 101', 'FIS 102'],
      'Second Semester': ['FIS 103', 'FIS 104'],
    },
    '200': {
      'First Semester': ['FIS 201', 'FIS 202'],
      'Second Semester': ['FIS 203', 'FIS 204'],
    },
    '300': {
      'First Semester': ['FIS 301', 'FIS 302'],
      'Second Semester': ['FIS 303', 'FIS 304'],
    },
    '400': {
      'First Semester': ['FIS 401', 'FIS 402'],
      'Second Semester': ['FIS 403', 'FIS 404'],
    },
    '500': {
      'First Semester': ['FIS 501', 'FIS 502'],
      'Second Semester': ['FIS 503', 'FIS 504'],
    },
  },
  'Agricultural Economics': {
    '100': {
      'First Semester': ['AGR 101', 'AGR 102'],
      'Second Semester': ['AGR 103', 'AGR 104'],
    },
    '200': {
      'First Semester': ['AGR 201', 'AGR 202'],
      'Second Semester': ['AGR 203', 'AGR 204'],
    },
    '300': {
      'First Semester': ['AGR 301', 'AGR 302'],
      'Second Semester': ['AGR 303', 'AGR 304'],
    },
    '400': {
      'First Semester': ['AGR 401', 'AGR 402'],
      'Second Semester': ['AGR 403', 'AGR 404'],
    },
  },

  // ENVIRONMENTAL DESIGN FACULTY
  'Architecture': {
    '100': {
      'First Semester': ['ARC 101', 'ARC 102'],
      'Second Semester': ['ARC 103', 'ARC 104'],
    },
    '200': {
      'First Semester': ['ARC 201', 'ARC 202'],
      'Second Semester': ['ARC 203', 'ARC 204'],
    },
    '300': {
      'First Semester': ['ARC 301', 'ARC 302'],
      'Second Semester': ['ARC 303', 'ARC 304'],
    },
    '400': {
      'First Semester': ['ARC 401', 'ARC 402'],
      'Second Semester': ['ARC 403', 'ARC 404'],
    },
    '500': {
      'First Semester': ['ARC 501', 'ARC 502'],
      'Second Semester': ['ARC 503', 'ARC 504'],
    },
  },
  'Urban and Regional Planning': {
    '100': {
      'First Semester': ['URP 101', 'URP 102'],
      'Second Semester': ['URP 103', 'URP 104'],
    },
    '200': {
      'First Semester': ['URP 201', 'URP 202'],
      'Second Semester': ['URP 203', 'URP 204'],
    },
    '300': {
      'First Semester': ['URP 301', 'URP 302'],
      'Second Semester': ['URP 303', 'URP 304'],
    },
    '400': {
      'First Semester': ['URP 401', 'URP 402'],
      'Second Semester': ['URP 403', 'URP 404'],
    },
    '500': {
      'First Semester': ['URP 501', 'URP 502'],
      'Second Semester': ['URP 503', 'URP 504'],
    },
  },
  'Fine Arts': {
    '100': {
      'First Semester': ['FIA 101', 'FIA 102'],
      'Second Semester': ['FIA 103', 'FIA 104'],
    },
    '200': {
      'First Semester': ['FIA 201', 'FIA 202'],
      'Second Semester': ['FIA 203', 'FIA 204'],
    },
    '300': {
      'First Semester': ['FIA 301', 'FIA 302'],
      'Second Semester': ['FIA 303', 'FIA 304'],
    },
    '400': {
      'First Semester': ['FIA 401', 'FIA 402'],
      'Second Semester': ['FIA 403', 'FIA 404'],
    },
  },
  'Industrial Design': {
    '100': {
      'First Semester': ['IND 101', 'IND 102'],
      'Second Semester': ['IND 103', 'IND 104'],
    },
    '200': {
      'First Semester': ['IND 201', 'IND 202'],
      'Second Semester': ['IND 203', 'IND 204'],
    },
    '300': {
      'First Semester': ['IND 301', 'IND 302'],
      'Second Semester': ['IND 303', 'IND 304'],
    },
    '400': {
      'First Semester': ['IND 401', 'IND 402'],
      'Second Semester': ['IND 403', 'IND 404'],
    },
    '500': {
      'First Semester': ['IND 501', 'IND 502'],
      'Second Semester': ['IND 503', 'IND 504'],
    },
  },
  'Geomatics': {
    '100': {
      'First Semester': ['GMT 101', 'GMT 102'],
      'Second Semester': ['GMT 103', 'GMT 104'],
    },
    '200': {
      'First Semester': ['GMT 201', 'GMT 202'],
      'Second Semester': ['GMT 203', 'GMT 204'],
    },
    '300': {
      'First Semester': ['GMT 301', 'GMT 302'],
      'Second Semester': ['GMT 303', 'GMT 304'],
    },
    '400': {
      'First Semester': ['GMT 401', 'GMT 402'],
      'Second Semester': ['GMT 403', 'GMT 404'],
    },
    '500': {
      'First Semester': ['GMT 501', 'GMT 502'],
      'Second Semester': ['GMT 503', 'GMT 504'],
    },
  },
  'Glass and Silicate Technology': {
    // Often related to Industrial Design or separate
    '100': {
      'First Semester': ['GST 101', 'GST 102'],
      'Second Semester': ['GST 103', 'GST 104'],
    },
    '200': {
      'First Semester': ['GST 201', 'GST 202'],
      'Second Semester': ['GST 203', 'GST 204'],
    },
    '300': {
      'First Semester': ['GST 301', 'GST 302'],
      'Second Semester': ['GST 303', 'GST 304'],
    },
    '400': {
      'First Semester': ['GST 401', 'GST 402'],
      'Second Semester': ['GST 403', 'GST 404'],
    },
  },
  'Building': {
    '100': {
      'First Semester': ['BLD 101', 'BLD 102'],
      'Second Semester': ['BLD 103', 'BLD 104'],
    },
    '200': {
      'First Semester': ['BLD 201', 'BLD 202'],
      'Second Semester': ['BLD 203', 'BLD 204'],
    },
    '300': {
      'First Semester': ['BLD 301', 'BLD 302'],
      'Second Semester': ['BLD 303', 'BLD 304'],
    },
    '400': {
      'First Semester': ['BLD 401', 'BLD 402'],
      'Second Semester': ['BLD 403', 'BLD 404'],
    },
    '500': {
      'First Semester': ['BLD 501', 'BLD 502'],
      'Second Semester': ['BLD 503', 'BLD 504'],
    },
  },

  // PHARMACY FACULTY
  'Islamic Law': {
    '100': {
      'First Semester': ['ISL 101', 'ISL 102'],
      'Second Semester': ['ISL 103', 'ISL 104'],
    },
    '200': {
      'First Semester': ['ISL 201', 'ISL 202'],
      'Second Semester': ['ISL 203', 'ISL 204'],
    },
    '300': {
      'First Semester': ['ISL 301', 'ISL 302'],
      'Second Semester': ['ISL 303', 'ISL 304'],
    },
    '400': {
      'First Semester': ['ISL 401', 'ISL 402'],
      'Second Semester': ['ISL 403', 'ISL 404'],
    },
    '500': {
      'First Semester': ['ISL 501', 'ISL 502'],
      'Second Semester': ['ISL 503', 'ISL 504'],
    },
  },
  'Commercial Law': {
    '100': {
      'First Semester': ['CML 101', 'CML 102'],
      'Second Semester': ['CML 103', 'CML 104'],
    },
    '200': {
      'First Semester': ['CML 201', 'CML 202'],
      'Second Semester': ['CML 203', 'CML 204'],
    },
    '300': {
      'First Semester': ['CML 301', 'CML 302'],
      'Second Semester': ['CML 303', 'CML 304'],
    },
    '400': {
      'First Semester': ['CML 401', 'CML 402'],
      'Second Semester': ['CML 403', 'CML 404'],
    },
    '500': {
      'First Semester': ['CML 501', 'CML 502'],
      'Second Semester': ['CML 503', 'CML 504'],
    },
  },
  'Private Law': {
    '100': {
      'First Semester': ['PVL 101', 'PVL 102'],
      'Second Semester': ['PVL 103', 'PVL 104'],
    },
    '200': {
      'First Semester': ['PVL 201', 'PVL 202'],
      'Second Semester': ['PVL 203', 'PVL 204'],
    },
    '300': {
      'First Semester': ['PVL 301', 'PVL 302'],
      'Second Semester': ['PVL 303', 'PVL 304'],
    },
    '400': {
      'First Semester': ['PVL 401', 'PVL 402'],
      'Second Semester': ['PVL 403', 'PVL 404'],
    },
    '500': {
      'First Semester': ['PVL 501', 'PVL 502'],
      'Second Semester': ['PVL 503', 'PVL 504'],
    },
  },
  'Public Law': {
    '100': {
      'First Semester': ['PBL 101', 'PBL 102'],
      'Second Semester': ['PBL 103', 'PBL 104'],
    },
    '200': {
      'First Semester': ['PBL 201', 'PBL 202'],
      'Second Semester': ['PBL 203', 'PBL 204'],
    },
    '300': {
      'First Semester': ['PBL 301', 'PBL 302'],
      'Second Semester': ['PBL 303', 'PBL 304'],
    },
    '400': {
      'First Semester': ['PBL 401', 'PBL 402'],
      'Second Semester': ['PBL 403', 'PBL 404'],
    },
    '500': {
      'First Semester': ['PBL 501', 'PBL 502'],
      'Second Semester': ['PBL 503', 'PBL 504'],
    },
  },

  // LIFE SCIENCES FACULTY (Adding missing depts)
  'Botany': {
    '100': {
      'First Semester': ['BOT 101', 'BOT 102'],
      'Second Semester': ['BOT 103', 'BOT 104'],
    },
    '200': {
      'First Semester': ['BOT 201', 'BOT 202'],
      'Second Semester': ['BOT 203', 'BOT 204'],
    },
    '300': {
      'First Semester': ['BOT 301', 'BOT 302'],
      'Second Semester': ['BOT 303', 'BOT 304'],
    },
    '400': {
      'First Semester': ['BOT 401', 'BOT 402'],
      'Second Semester': ['BOT 403', 'BOT 404'],
    },
  },
  'Zoology': {
    '100': {
      'First Semester': ['ZOO 101', 'ZOO 102'],
      'Second Semester': ['ZOO 103', 'ZOO 104'],
    },
    '200': {
      'First Semester': ['ZOO 201', 'ZOO 202'],
      'Second Semester': ['ZOO 203', 'ZOO 204'],
    },
    '300': {
      'First Semester': ['ZOO 301', 'ZOO 302'],
      'Second Semester': ['ZOO 303', 'ZOO 304'],
    },
    '400': {
      'First Semester': ['ZOO 401', 'ZOO 402'],
      'Second Semester': ['ZOO 403', 'ZOO 404'],
    },
  },

  // PHARMACY FACULTY (Adding missing depts)
  'Clinical Pharmacy and Pharmacy Administration': {
    '100': {
      'First Semester': ['CPP 101', 'CPP 102'],
      'Second Semester': ['CPP 103', 'CPP 104'],
    },
    '200': {
      'First Semester': ['CPP 201', 'CPP 202'],
      'Second Semester': ['CPP 203', 'CPP 204'],
    },
    '300': {
      'First Semester': ['CPP 301', 'CPP 302'],
      'Second Semester': ['CPP 303', 'CPP 304'],
    },
    '400': {
      'First Semester': ['CPP 401', 'CPP 402'],
      'Second Semester': ['CPP 403', 'CPP 404'],
    },
    '500': {
      'First Semester': ['CPP 501', 'CPP 502'],
      'Second Semester': ['CPP 503', 'CPP 504'],
    },
  },
  'Pharmaceutical and Medicinal Chemistry': {
    '100': {
      'First Semester': ['PMC 101', 'PMC 102'],
      'Second Semester': ['PMC 103', 'PMC 104'],
    },
    '200': {
      'First Semester': ['PMC 201', 'PMC 202'],
      'Second Semester': ['PMC 203', 'PMC 204'],
    },
    '300': {
      'First Semester': ['PMC 301', 'PMC 302'],
      'Second Semester': ['PMC 303', 'PMC 304'],
    },
    '400': {
      'First Semester': ['PMC 401', 'PMC 402'],
      'Second Semester': ['PMC 403', 'PMC 404'],
    },
    '500': {
      'First Semester': ['PMC 501', 'PMC 502'],
      'Second Semester': ['PMC 503', 'PMC 504'],
    },
  },
  'Pharmaceutics and Pharmaceutical Microbiology': {
    '100': {
      'First Semester': ['PPM 101', 'PPM 102'],
      'Second Semester': ['PPM 103', 'PPM 104'],
    },
    '200': {
      'First Semester': ['PPM 201', 'PPM 202'],
      'Second Semester': ['PPM 203', 'PPM 204'],
    },
    '300': {
      'First Semester': ['PPM 301', 'PPM 302'],
      'Second Semester': ['PPM 303', 'PPM 304'],
    },
    '400': {
      'First Semester': ['PPM 401', 'PPM 402'],
      'Second Semester': ['PPM 403', 'PPM 404'],
    },
    '500': {
      'First Semester': ['PPM 501', 'PPM 502'],
      'Second Semester': ['PPM 503', 'PPM 504'],
    },
  },
  'Pharmacognosy and Drug Development': {
    '100': {
      'First Semester': ['PDD 101', 'PDD 102'],
      'Second Semester': ['PDD 103', 'PDD 104'],
    },
    '200': {
      'First Semester': ['PDD 201', 'PDD 202'],
      'Second Semester': ['PDD 203', 'PDD 204'],
    },
    '300': {
      'First Semester': ['PDD 301', 'PDD 302'],
      'Second Semester': ['PDD 303', 'PDD 304'],
    },
    '400': {
      'First Semester': ['PDD 401', 'PDD 402'],
      'Second Semester': ['PDD 403', 'PDD 404'],
    },
    '500': {
      'First Semester': ['PDD 501', 'PDD 502'],
      'Second Semester': ['PDD 503', 'PDD 504'],
    },
  },
  'Pharmacology and Therapeutics': {
    '100': {
      'First Semester': ['PHT 101', 'PHT 102'],
      'Second Semester': ['PHT 103', 'PHT 104'],
    },
    '200': {
      'First Semester': ['PHT 201', 'PHT 202'],
      'Second Semester': ['PHT 203', 'PHT 204'],
    },
    '300': {
      'First Semester': ['PHT 301', 'PHT 302'],
      'Second Semester': ['PHT 303', 'PHT 304'],
    },
    '400': {
      'First Semester': ['PHT 401', 'PHT 402'],
      'Second Semester': ['PHT 403', 'PHT 404'],
    },
    '500': {
      'First Semester': ['PHT 501', 'PHT 502'],
      'Second Semester': ['PHT 503', 'PHT 504'],
    },
  },

  'Pharmacy': {
    '100': {
      'First Semester': ['PHM 101', 'PHM 102'],
      'Second Semester': ['PHM 103', 'PHM 104'],
    },
    '200': {
      'First Semester': ['PHM 201', 'PHM 202'],
      'Second Semester': ['PHM 203', 'PHM 204'],
    },
    '300': {
      'First Semester': ['PHM 301', 'PHM 302'],
      'Second Semester': ['PHM 303', 'PHM 304'],
    },
    '400': {
      'First Semester': ['PHM 401', 'PHM 402'],
      'Second Semester': ['PHM 403', 'PHM 404'],
    },
    '500': {
      'First Semester': ['PHM 501', 'PHM 502'],
      'Second Semester': ['PHM 503', 'PHM 504'],
    },
  },

  // ALLIED HEALTH SCIENCES FACULTY
  'Nursing Science': {
    '100': {
      'First Semester': ['NUR 101', 'NUR 102'],
      'Second Semester': ['NUR 103', 'NUR 104'],
    },
    '200': {
      'First Semester': ['NUR 201', 'NUR 202'],
      'Second Semester': ['NUR 203', 'NUR 204'],
    },
    '300': {
      'First Semester': ['NUR 301', 'NUR 302'],
      'Second Semester': ['NUR 303', 'NUR 304'],
    },
    '400': {
      'First Semester': ['NUR 401', 'NUR 402'],
      'Second Semester': ['NUR 403', 'NUR 404'],
    },
    '500': {
      'First Semester': ['NUR 501', 'NUR 502'],
      'Second Semester': ['NUR 503', 'NUR 504'],
    },
  },
  'Medical Laboratory Science': {
    '100': {
      'First Semester': ['MLS 101', 'MLS 102'],
      'Second Semester': ['MLS 103', 'MLS 104'],
    },
    '200': {
      'First Semester': ['MLS 201', 'MLS 202'],
      'Second Semester': ['MLS 203', 'MLS 204'],
    },
    '300': {
      'First Semester': ['MLS 301', 'MLS 302'],
      'Second Semester': ['MLS 303', 'MLS 304'],
    },
    '400': {
      'First Semester': ['MLS 401', 'MLS 402'],
      'Second Semester': ['MLS 403', 'MLS 404'],
    },
    '500': {
      'First Semester': ['MLS 501', 'MLS 502'],
      'Second Semester': ['MLS 503', 'MLS 504'],
    },
  },
  'Medical Radiography': {
    '100': {
      'First Semester': ['RAD 101', 'RAD 102'],
      'Second Semester': ['RAD 103', 'RAD 104'],
    },
    '200': {
      'First Semester': ['RAD 201', 'RAD 202'],
      'Second Semester': ['RAD 203', 'RAD 204'],
    },
    '300': {
      'First Semester': ['RAD 301', 'RAD 302'],
      'Second Semester': ['RAD 303', 'RAD 304'],
    },
    '400': {
      'First Semester': ['RAD 401', 'RAD 402'],
      'Second Semester': ['RAD 403', 'RAD 404'],
    },
    '500': {
      'First Semester': ['RAD 501', 'RAD 502'],
      'Second Semester': ['RAD 503', 'RAD 504'],
    },
  },

  // ARTS FACULTY (Adding missing depts)
  'Archaeology': {
    '100': {
      'First Semester': ['ARC 101', 'ARC 102'],
      'Second Semester': ['ARC 103', 'ARC 104'],
    },
    '200': {
      'First Semester': ['ARC 201', 'ARC 202'],
      'Second Semester': ['ARC 203', 'ARC 204'],
    },
    '300': {
      'First Semester': ['ARC 301', 'ARC 302'],
      'Second Semester': ['ARC 303', 'ARC 304'],
    },
    '400': {
      'First Semester': ['ARC 401', 'ARC 402'],
      'Second Semester': ['ARC 403', 'ARC 404'],
    },
  },
  'Theatre and Performing Arts': {
    '100': {
      'First Semester': ['TPA 101', 'TPA 102'],
      'Second Semester': ['TPA 103', 'TPA 104'],
    },
    '200': {
      'First Semester': ['TPA 201', 'TPA 202'],
      'Second Semester': ['TPA 203', 'TPA 204'],
    },
    '300': {
      'First Semester': ['TPA 301', 'TPA 302'],
      'Second Semester': ['TPA 303', 'TPA 304'],
    },
    '400': {
      'First Semester': ['TPA 401', 'TPA 402'],
      'Second Semester': ['TPA 403', 'TPA 404'],
    },
  },
  'French': {
    '100': {
      'First Semester': ['FRE 101', 'FRE 102'],
      'Second Semester': ['FRE 103', 'FRE 104'],
    },
    '200': {
      'First Semester': ['FRE 201', 'FRE 202'],
      'Second Semester': ['FRE 203', 'FRE 204'],
    },
    '300': {
      'First Semester': ['FRE 301', 'FRE 302'],
      'Second Semester': ['FRE 303', 'FRE 304'],
    },
    '400': {
      'First Semester': ['FRE 401', 'FRE 402'],
      'Second Semester': ['FRE 403', 'FRE 404'],
    },
  },
  'African Languages and Cultures': {
    '100': {
      'First Semester': ['ALC 101', 'ALC 102'],
      'Second Semester': ['ALC 103', 'ALC 104'],
    },
    '200': {
      'First Semester': ['ALC 201', 'ALC 202'],
      'Second Semester': ['ALC 203', 'ALC 204'],
    },
    '300': {
      'First Semester': ['ALC 301', 'ALC 302'],
      'Second Semester': ['ALC 303', 'ALC 304'],
    },
    '400': {
      'First Semester': ['ALC 401', 'ALC 402'],
      'Second Semester': ['ALC 403', 'ALC 404'],
    },
  },
  // BASIC MEDICAL SCIENCES FACULTY
  'Human Anatomy': {
    '100': {
      'First Semester': ['ANA 101', 'ANA 102'],
      'Second Semester': ['ANA 103', 'ANA 104'],
    },
    '200': {
      'First Semester': ['ANA 201', 'ANA 202'],
      'Second Semester': ['ANA 203', 'ANA 204'],
    },
    '300': {
      'First Semester': ['ANA 301', 'ANA 302'],
      'Second Semester': ['ANA 303', 'ANA 304'],
    },
    '400': {
      'First Semester': ['ANA 401', 'ANA 402'],
      'Second Semester': ['ANA 403', 'ANA 404'],
    },
    '500': {
      'First Semester': ['ANA 501', 'ANA 502'],
      'Second Semester': ['ANA 503', 'ANA 504'],
    },
  },
  'Human Physiology': {
    '100': {
      'First Semester': ['PHS 101', 'PHS 102'],
      'Second Semester': ['PHS 103', 'PHS 104'],
    },
    '200': {
      'First Semester': ['PHS 201', 'PHS 202'],
      'Second Semester': ['PHS 203', 'PHS 204'],
    },
    '300': {
      'First Semester': ['PHS 301', 'PHS 302'],
      'Second Semester': ['PHS 303', 'PHS 304'],
    },
    '400': {
      'First Semester': ['PHS 401', 'PHS 402'],
      'Second Semester': ['PHS 403', 'PHS 404'],
    },
    '500': {
      'First Semester': ['PHS 501', 'PHS 502'],
      'Second Semester': ['PHS 503', 'PHS 504'],
    },
  },

  // CLINICAL SCIENCES FACULTY
  'Dental Surgery': {
    '100': {
      'First Semester': ['DEN 101', 'DEN 102'],
      'Second Semester': ['DEN 103', 'DEN 104'],
    },
    '200': {
      'First Semester': ['DEN 201', 'DEN 202'],
      'Second Semester': ['DEN 203', 'DEN 204'],
    },
    '300': {
      'First Semester': ['DEN 301', 'DEN 302'],
      'Second Semester': ['DEN 303', 'DEN 304'],
    },
    '400': {
      'First Semester': ['DEN 401', 'DEN 402'],
      'Second Semester': ['DEN 403', 'DEN 404'],
    },
    '500': {
      'First Semester': ['DEN 501', 'DEN 502'],
      'Second Semester': ['DEN 503', 'DEN 504'],
    },
    '600': {
      'First Semester': ['DEN 601', 'DEN 602'],
      'Second Semester': ['DEN 603', 'DEN 604'],
    },
  },
  'Chemical Pathology': {
    '100': {
      'First Semester': ['CPA 101', 'CPA 102'],
      'Second Semester': ['CPA 103', 'CPA 104'],
    },
    '200': {
      'First Semester': ['CPA 201', 'CPA 202'],
      'Second Semester': ['CPA 203', 'CPA 204'],
    },
    '300': {
      'First Semester': ['CPA 301', 'CPA 302'],
      'Second Semester': ['CPA 303', 'CPA 304'],
    },
    '400': {
      'First Semester': ['CPA 401', 'CPA 402'],
      'Second Semester': ['CPA 403', 'CPA 404'],
    },
    '500': {
      'First Semester': ['CPA 501', 'CPA 502'],
      'Second Semester': ['CPA 503', 'CPA 504'],
    },
    '600': {
      'First Semester': ['CPA 601', 'CPA 602'],
      'Second Semester': ['CPA 603', 'CPA 604'],
    },
  },
  'Haematology and Blood Transfusion': {
    '100': {
      'First Semester': ['HBT 101', 'HBT 102'],
      'Second Semester': ['HBT 103', 'HBT 104'],
    },
    '200': {
      'First Semester': ['HBT 201', 'HBT 202'],
      'Second Semester': ['HBT 203', 'HBT 204'],
    },
    '300': {
      'First Semester': ['HBT 301', 'HBT 302'],
      'Second Semester': ['HBT 303', 'HBT 304'],
    },
    '400': {
      'First Semester': ['HBT 401', 'HBT 402'],
      'Second Semester': ['HBT 403', 'HBT 404'],
    },
    '500': {
      'First Semester': ['HBT 501', 'HBT 502'],
      'Second Semester': ['HBT 503', 'HBT 504'],
    },
    '600': {
      'First Semester': ['HBT 601', 'HBT 602'],
      'Second Semester': ['HBT 603', 'HBT 604'],
    },
  },
  'Community Medicine': {
    '100': {
      'First Semester': ['COM 101', 'COM 102'],
      'Second Semester': ['COM 103', 'COM 104'],
    },
    '200': {
      'First Semester': ['COM 201', 'COM 202'],
      'Second Semester': ['COM 203', 'COM 204'],
    },
    '300': {
      'First Semester': ['COM 301', 'COM 302'],
      'Second Semester': ['COM 303', 'COM 304'],
    },
    '400': {
      'First Semester': ['COM 401', 'COM 402'],
      'Second Semester': ['COM 403', 'COM 404'],
    },
    '500': {
      'First Semester': ['COM 501', 'COM 502'],
      'Second Semester': ['COM 503', 'COM 504'],
    },
    '600': {
      'First Semester': ['COM 601', 'COM 602'],
      'Second Semester': ['COM 603', 'COM 604'],
    },
  },
  'Medicine': {
    '100': {
      'First Semester': ['MED 101', 'MED 102'],
      'Second Semester': ['MED 103', 'MED 104'],
    },
    '200': {
      'First Semester': ['MED 201', 'MED 202'],
      'Second Semester': ['MED 203', 'MED 204'],
    },
    '300': {
      'First Semester': ['MED 301', 'MED 302'],
      'Second Semester': ['MED 303', 'MED 304'],
    },
    '400': {
      'First Semester': ['MED 401', 'MED 402'],
      'Second Semester': ['MED 403', 'MED 404'],
    },
    '500': {
      'First Semester': ['MED 501', 'MED 502'],
      'Second Semester': ['MED 503', 'MED 504'],
    },
    '600': {
      'First Semester': ['MED 601', 'MED 602'],
      'Second Semester': ['MED 603', 'MED 604'],
    },
  },
  'Pathology (Morbid Anatomy)': {
    '100': {
      'First Semester': ['PAT 101', 'PAT 102'],
      'Second Semester': ['PAT 103', 'PAT 104'],
    },
    '200': {
      'First Semester': ['PAT 201', 'PAT 202'],
      'Second Semester': ['PAT 203', 'PAT 204'],
    },
    '300': {
      'First Semester': ['PAT 301', 'PAT 302'],
      'Second Semester': ['PAT 303', 'PAT 304'],
    },
    '400': {
      'First Semester': ['PAT 401', 'PAT 402'],
      'Second Semester': ['PAT 403', 'PAT 404'],
    },
    '500': {
      'First Semester': ['PAT 501', 'PAT 502'],
      'Second Semester': ['PAT 503', 'PAT 504'],
    },
    '600': {
      'First Semester': ['PAT 601', 'PAT 602'],
      'Second Semester': ['PAT 603', 'PAT 604'],
    },
  },
  'Obstetrics and Gynecology': {
    '100': {
      'First Semester': ['OBG 101', 'OBG 102'],
      'Second Semester': ['OBG 103', 'OBG 104'],
    },
    '200': {
      'First Semester': ['OBG 201', 'OBG 202'],
      'Second Semester': ['OBG 203', 'OBG 204'],
    },
    '300': {
      'First Semester': ['OBG 301', 'OBG 302'],
      'Second Semester': ['OBG 303', 'OBG 304'],
    },
    '400': {
      'First Semester': ['OBG 401', 'OBG 402'],
      'Second Semester': ['OBG 403', 'OBG 404'],
    },
    '500': {
      'First Semester': ['OBG 501', 'OBG 502'],
      'Second Semester': ['OBG 503', 'OBG 504'],
    },
    '600': {
      'First Semester': ['OBG 601', 'OBG 602'],
      'Second Semester': ['OBG 603', 'OBG 604'],
    },
  },

  // EDUCATION FACULTY (Adding missing depts)
  'Arts and Social Science Education': {
    '100': {
      'First Semester': ['ASE 101', 'ASE 102'],
      'Second Semester': ['ASE 103', 'ASE 104'],
    },
    '200': {
      'First Semester': ['ASE 201', 'ASE 202'],
      'Second Semester': ['ASE 203', 'ASE 204'],
    },
    '300': {
      'First Semester': ['ASE 301', 'ASE 302'],
      'Second Semester': ['ASE 303', 'ASE 304'],
    },
    '400': {
      'First Semester': ['ASE 401', 'ASE 402'],
      'Second Semester': ['ASE 403', 'ASE 404'],
    },
  },
  'Educational Foundation and Curriculum': {
    '100': {
      'First Semester': ['EFC 101', 'EFC 102'],
      'Second Semester': ['EFC 103', 'EFC 104'],
    },
    '200': {
      'First Semester': ['EFC 201', 'EFC 202'],
      'Second Semester': ['EFC 203', 'EFC 204'],
    },
    '300': {
      'First Semester': ['EFC 301', 'EFC 302'],
      'Second Semester': ['EFC 303', 'EFC 304'],
    },
    '400': {
      'First Semester': ['EFC 401', 'EFC 402'],
      'Second Semester': ['EFC 403', 'EFC 404'],
    },
  },
  'Educational Psychology and Counselling': {
    '100': {
      'First Semester': ['EPC 101', 'EPC 102'],
      'Second Semester': ['EPC 103', 'EPC 104'],
    },
    '200': {
      'First Semester': ['EPC 201', 'EPC 202'],
      'Second Semester': ['EPC 203', 'EPC 204'],
    },
    '300': {
      'First Semester': ['EPC 301', 'EPC 302'],
      'Second Semester': ['EPC 303', 'EPC 304'],
    },
    '400': {
      'First Semester': ['EPC 401', 'EPC 402'],
      'Second Semester': ['EPC 403', 'EPC 404'],
    },
  },
  'Home Economics': {
    '100': {
      'First Semester': ['HEC 101', 'HEC 102'],
      'Second Semester': ['HEC 103', 'HEC 104'],
    },
    '200': {
      'First Semester': ['HEC 201', 'HEC 202'],
      'Second Semester': ['HEC 203', 'HEC 204'],
    },
    '300': {
      'First Semester': ['HEC 301', 'HEC 302'],
      'Second Semester': ['HEC 303', 'HEC 304'],
    },
    '400': {
      'First Semester': ['HEC 401', 'HEC 402'],
      'Second Semester': ['HEC 403', 'HEC 404'],
    },
  },
  'Vocational and Technical Education': {
    '100': {
      'First Semester': ['VTE 101', 'VTE 102'],
      'Second Semester': ['VTE 103', 'VTE 104'],
    },
    '200': {
      'First Semester': ['VTE 201', 'VTE 202'],
      'Second Semester': ['VTE 203', 'VTE 204'],
    },
    '300': {
      'First Semester': ['VTE 301', 'VTE 302'],
      'Second Semester': ['VTE 303', 'VTE 304'],
    },
    '400': {
      'First Semester': ['VTE 401', 'VTE 402'],
      'Second Semester': ['VTE 403', 'VTE 404'],
    },
  },
  'Physical and Health Education': {
    '100': {
      'First Semester': ['PHE 101', 'PHE 102'],
      'Second Semester': ['PHE 103', 'PHE 104'],
    },
    '200': {
      'First Semester': ['PHE 201', 'PHE 202'],
      'Second Semester': ['PHE 203', 'PHE 204'],
    },
    '300': {
      'First Semester': ['PHE 301', 'PHE 302'],
      'Second Semester': ['PHE 303', 'PHE 304'],
    },
    '400': {
      'First Semester': ['PHE 401', 'PHE 402'],
      'Second Semester': ['PHE 403', 'PHE 404'],
    },
  },
  'Human Kinetics and Health Education': {
    '100': {
      'First Semester': ['HKH 101', 'HKH 102'],
      'Second Semester': ['HKH 103', 'HKH 104'],
    },
    '200': {
      'First Semester': ['HKH 201', 'HKH 202'],
      'Second Semester': ['HKH 203', 'HKH 204'],
    },
    '300': {
      'First Semester': ['HKH 301', 'HKH 302'],
      'Second Semester': ['HKH 303', 'HKH 304'],
    },
    '400': {
      'First Semester': ['HKH 401', 'HKH 402'],
      'Second Semester': ['HKH 403', 'HKH 404'],
    },
  },
  'Library and Information Science': {
    '100': {
      'First Semester': ['LIS 101', 'LIS 102'],
      'Second Semester': ['LIS 103', 'LIS 104'],
    },
    '200': {
      'First Semester': ['LIS 201', 'LIS 202'],
      'Second Semester': ['LIS 203', 'LIS 204'],
    },
    '300': {
      'First Semester': ['LIS 301', 'LIS 302'],
      'Second Semester': ['LIS 303', 'LIS 304'],
    },
    '400': {
      'First Semester': ['LIS 401', 'LIS 402'],
      'Second Semester': ['LIS 403', 'LIS 404'],
    },
  },

  'Veterinary Medicine': {
    '100': {
      'First Semester': ['VET 101', 'VET 102'],
      'Second Semester': ['VET 103', 'VET 104'],
    },
    '200': {
      'First Semester': ['VET 201', 'VET 202'],
      'Second Semester': ['VET 203', 'VET 204'],
    },
    '300': {
      'First Semester': ['VET 301', 'VET 302'],
      'Second Semester': ['VET 303', 'VET 304'],
    },
    '400': {
      'First Semester': ['VET 401', 'VET 402'],
      'Second Semester': ['VET 403', 'VET 404'],
    },
    '500': {
      'First Semester': ['VET 501', 'VET 502'],
      'Second Semester': ['VET 503', 'VET 504'],
    },
    '600': {
      'First Semester': ['VET 601', 'VET 602'],
      'Second Semester': ['VET 603', 'VET 604'],
    },
  },
  'Veterinary Anatomy': {
    '100': {
      'First Semester': ['VAN 101', 'VAN 102'],
      'Second Semester': ['VAN 103', 'VAN 104'],
    },
    '200': {
      'First Semester': ['VAN 201', 'VAN 202'],
      'Second Semester': ['VAN 203', 'VAN 204'],
    },
    '300': {
      'First Semester': ['VAN 301', 'VAN 302'],
      'Second Semester': ['VAN 303', 'VAN 304'],
    },
    '400': {
      'First Semester': ['VAN 401', 'VAN 402'],
      'Second Semester': ['VAN 403', 'VAN 404'],
    },
    '500': {
      'First Semester': ['VAN 501', 'VAN 502'],
      'Second Semester': ['VAN 503', 'VAN 504'],
    },
    '600': {
      'First Semester': ['VAN 601', 'VAN 602'],
      'Second Semester': ['VAN 603', 'VAN 604'],
    },
  },
  'Veterinary Pathology': {
    '100': {
      'First Semester': ['VPA 101', 'VPA 102'],
      'Second Semester': ['VPA 103', 'VPA 104'],
    },
    '200': {
      'First Semester': ['VPA 201', 'VPA 202'],
      'Second Semester': ['VPA 203', 'VPA 204'],
    },
    '300': {
      'First Semester': ['VPA 301', 'VPA 302'],
      'Second Semester': ['VPA 303', 'VPA 304'],
    },
    '400': {
      'First Semester': ['VPA 401', 'VPA 402'],
      'Second Semester': ['VPA 403', 'VPA 404'],
    },
    '500': {
      'First Semester': ['VPA 501', 'VPA 502'],
      'Second Semester': ['VPA 503', 'VPA 504'],
    },
    '600': {
      'First Semester': ['VPA 601', 'VPA 602'],
      'Second Semester': ['VPA 603', 'VPA 604'],
    },
  },
  'Veterinary Parasitology and Entomology': {
    '100': {
      'First Semester': ['VPE 101', 'VPE 102'],
      'Second Semester': ['VPE 103', 'VPE 104'],
    },
    '200': {
      'First Semester': ['VPE 201', 'VPE 202'],
      'Second Semester': ['VPE 203', 'VPE 204'],
    },
    '300': {
      'First Semester': ['VPE 301', 'VPE 302'],
      'Second Semester': ['VPE 303', 'VPE 304'],
    },
    '400': {
      'First Semester': ['VPE 401', 'VPE 402'],
      'Second Semester': ['VPE 403', 'VPE 404'],
    },
    '500': {
      'First Semester': ['VPE 501', 'VPE 502'],
      'Second Semester': ['VPE 503', 'VPE 504'],
    },
    '600': {
      'First Semester': ['VPE 601', 'VPE 602'],
      'Second Semester': ['VPE 603', 'VPE 604'],
    },
  },
  'Veterinary Public Health and Preventive Medicine': {
    '100': {
      'First Semester': ['VPH 101', 'VPH 102'],
      'Second Semester': ['VPH 103', 'VPH 104'],
    },
    '200': {
      'First Semester': ['VPH 201', 'VPH 202'],
      'Second Semester': ['VPH 203', 'VPH 204'],
    },
    '300': {
      'First Semester': ['VPH 301', 'VPH 302'],
      'Second Semester': ['VPH 303', 'VPH 304'],
    },
    '400': {
      'First Semester': ['VPH 401', 'VPH 402'],
      'Second Semester': ['VPH 403', 'VPH 404'],
    },
    '500': {
      'First Semester': ['VPH 501', 'VPH 502'],
      'Second Semester': ['VPH 503', 'VPH 504'],
    },
    '600': {
      'First Semester': ['VPH 601', 'VPH 602'],
      'Second Semester': ['VPH 603', 'VPH 604'],
    },
  },
  'Veterinary Surgery': {
    '100': {
      'First Semester': ['VSU 101', 'VSU 102'],
      'Second Semester': ['VSU 103', 'VSU 104'],
    },
    '200': {
      'First Semester': ['VSU 201', 'VSU 202'],
      'Second Semester': ['VSU 203', 'VSU 204'],
    },
    '300': {
      'First Semester': ['VSU 301', 'VSU 302'],
      'Second Semester': ['VSU 303', 'VSU 304'],
    },
    '400': {
      'First Semester': ['VSU 401', 'VSU 402'],
      'Second Semester': ['VSU 403', 'VSU 404'],
    },
    '500': {
      'First Semester': ['VSU 501', 'VSU 502'],
      'Second Semester': ['VSU 503', 'VSU 504'],
    },
    '600': {
      'First Semester': ['VSU 601', 'VSU 602'],
      'Second Semester': ['VSU 603', 'VSU 604'],
    },
  },
  'Theriogenology': {
    '100': {
      'First Semester': ['THE 101', 'THE 102'],
      'Second Semester': ['THE 103', 'THE 104'],
    },
    '200': {
      'First Semester': ['THE 201', 'THE 202'],
      'Second Semester': ['THE 203', 'THE 204'],
    },
    '300': {
      'First Semester': ['THE 301', 'THE 302'],
      'Second Semester': ['THE 303', 'THE 304'],
    },
    '400': {
      'First Semester': ['THE 401', 'THE 402'],
      'Second Semester': ['THE 403', 'THE 404'],
    },
    '500': {
      'First Semester': ['THE 501', 'THE 502'],
      'Second Semester': ['THE 503', 'THE 504'],
    },
    '600': {
      'First Semester': ['THE 601', 'THE 602'],
      'Second Semester': ['THE 603', 'THE 604'],
    },
  },
  'Veterinary Microbiology': {
    '100': {
      'First Semester': ['VMI 101', 'VMI 102'],
      'Second Semester': ['VMI 103', 'VMI 104'],
    },
    '200': {
      'First Semester': ['VMI 201', 'VMI 202'],
      'Second Semester': ['VMI 203', 'VMI 204'],
    },
    '300': {
      'First Semester': ['VMI 301', 'VMI 302'],
      'Second Semester': ['VMI 303', 'VMI 304'],
    },
    '400': {
      'First Semester': ['VMI 401', 'VMI 402'],
      'Second Semester': ['VMI 403', 'VMI 404'],
    },
    '500': {
      'First Semester': ['VMI 501', 'VMI 502'],
      'Second Semester': ['VMI 503', 'VMI 504'],
    },
    '600': {
      'First Semester': ['VMI 601', 'VMI 602'],
      'Second Semester': ['VMI 603', 'VMI 604'],
    },
  },
  'Veterinary Physiology': {
    '100': {
      'First Semester': ['VPH 101', 'VPH 102'],
      'Second Semester': ['VPH 103', 'VPH 104'],
    },
    '200': {
      'First Semester': ['VPH 201', 'VPH 202'],
      'Second Semester': ['VPH 203', 'VPH 204'],
    },
    '300': {
      'First Semester': ['VPH 301', 'VPH 302'],
      'Second Semester': ['VPH 303', 'VPH 304'],
    },
    '400': {
      'First Semester': ['VPH 401', 'VPH 402'],
      'Second Semester': ['VPH 403', 'VPH 404'],
    },
    '500': {
      'First Semester': ['VPH 501', 'VPH 502'],
      'Second Semester': ['VPH 503', 'VPH 504'],
    },
    '600': {
      'First Semester': ['VPH 601', 'VPH 602'],
      'Second Semester': ['VPH 603', 'VPH 604'],
    },
  },
  'Veterinary Pharmacology and Toxicology': {
    '100': {
      'First Semester': ['VPT 101', 'VPT 102'],
      'Second Semester': ['VPT 103', 'VPT 104'],
    },
    '200': {
      'First Semester': ['VPT 201', 'VPT 202'],
      'Second Semester': ['VPT 203', 'VPT 204'],
    },
    '300': {
      'First Semester': ['VPT 301', 'VPT 302'],
      'Second Semester': ['VPT 303', 'VPT 304'],
    },
    '400': {
      'First Semester': ['VPT 401', 'VPT 402'],
      'Second Semester': ['VPT 403', 'VPT 404'],
    },
    '500': {
      'First Semester': ['VPT 501', 'VPT 502'],
      'Second Semester': ['VPT 503', 'VPT 504'],
    },
    '600': {
      'First Semester': ['VPT 601', 'VPT 602'],
      'Second Semester': ['VPT 603', 'VPT 604'],
    },
  },
};

const courseTitles = {
  // Computer Engineering
  'COE 101': 'Introduction to Computer Engineering',
  'COE 102': 'Programming Fundamentals',
  'COE 201': 'Data Structures',
  'COE 202': 'Computer Organization',
  'COE 203': 'Object Oriented Programming',
  'COE 204': 'Discrete Mathematics',
  'COE 301': 'Digital Electronics',
  'COE 302': 'Computer Architecture',
  'COE 303': 'Signals and Systems',
  'COE 304': 'Operating Systems',
  'COE 305': 'Database Systems',
  'COE 306': 'Computer Networks',

  // Computer Science
  'CSC 101': 'Introduction to Computer Science',
  'CSC 102': 'Introduction to Problem Solving',
  'CSC 103': 'Computer Programming I',
  'CSC 104': 'Discrete Structures',
  'CSC 201': 'Computer Programming II',
  'CSC 202': 'Data Structures and Algorithms',
  'CSC 203': 'Digital Logic Design',
  'CSC 204': 'Object Oriented Programming',
  'CSC 205': 'Web Technologies',
  'CSC 206': 'Database Management Systems',
  'CSC 301': 'Software Engineering',
  'CSC 302': 'Operating Systems',
  'CSC 303': 'Computer Networks',
  'CSC 304': 'Artificial Intelligence',
  'CSC 305': 'Theory of Computation',
  'CSC 306': 'Computer Graphics',

  // Civil Engineering
  'CVE 101': 'Introduction to Civil Engineering',
  'CVE 102': 'Engineering Drawing',
  'CVE 201': 'Strength of Materials',
  'CVE 202': 'Fluid Mechanics',
  'CVE 203': 'Surveying I',
  'CVE 204': 'Structural Analysis',
  'CVE 205': 'Soil Mechanics',
  'CVE 206': 'Hydraulics',

  // Electrical Engineering
  'EEE 101': 'Introduction to Electrical Engineering',
  'EEE 102': 'Circuit Theory I',
  'EEE 201': 'Circuit Theory II',
  'EEE 202': 'Electromagnetic Fields',
  'EEE 203': 'Electronic Devices',
  'EEE 204': 'Power Systems I',
  'EEE 205': 'Control Systems',
  'EEE 206': 'Digital Electronics',

  // Mechanical Engineering
  'MEE 101': 'Introduction to Mechanical Engineering',
  'MEE 102': 'Engineering Mechanics I',
  'MEE 201': 'Engineering Mechanics II',
  'MEE 202': 'Thermodynamics I',
  'MEE 203': 'Strength of Materials',
  'MEE 204': 'Fluid Mechanics',
  'MEE 205': 'Machine Design',
  'MEE 206': 'Manufacturing Processes',

  // General Courses
  'MATH 101': 'General Mathematics I',
  'MATH 102': 'General Mathematics II',
  'MATH 201': 'Engineering Mathematics I',
  'PHYS 101': 'General Physics I',
  'CHM 101': 'General Chemistry I',
  'GEG 101': 'Engineering Drawing I',
  'GEG 102': 'Engineering Drawing II',
};
