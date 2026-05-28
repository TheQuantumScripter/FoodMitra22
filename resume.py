from reportlab.platypus import SimpleDocTemplate, Paragraph, Spacer
from reportlab.lib.styles import getSampleStyleSheet
from reportlab.lib.pagesizes import A4

# Create document
doc = SimpleDocTemplate("Om_Bairagi_TataPower_Resume.pdf", pagesize=A4)

styles = getSampleStyleSheet()
content = []

# Title
content.append(Paragraph("<b>OM RAMESHVAR BAIRAGI</b>", styles['Title']))
content.append(Spacer(1, 10))

# Contact Info
content.append(Paragraph("📞 8265003426 | ✉️ bairagiom524@gmail.com", styles['Normal']))
content.append(Paragraph("Kolhewasti, Yesgaon, Kopargaon, Maharashtra", styles['Normal']))
content.append(Spacer(1, 10))

# Objective
content.append(Paragraph("<b>Career Objective</b>", styles['Heading2']))
content.append(Paragraph(
    "Seeking an opportunity in Electrical Engineering at Tata Power to apply practical knowledge "
    "of electrical systems, circuits, and safety practices while contributing to efficient energy solutions.",
    styles['Normal']
))
content.append(Spacer(1, 10))

# Education
content.append(Paragraph("<b>Education</b>", styles['Heading2']))
content.append(Paragraph("Diploma in Electrical Engineering (Pursuing) - MSBTE", styles['Normal']))
content.append(Paragraph("Sanjivani K.B.P Polytechnic, Kopargaon | 5th Sem: 80.94%", styles['Normal']))
content.append(Paragraph("HSC - 44.17% | SSC - 68.20%", styles['Normal']))
content.append(Spacer(1, 10))

# Skills
content.append(Paragraph("<b>Technical Skills</b>", styles['Heading2']))
content.append(Paragraph("• Electrical Equipment Maintenance", styles['Normal']))
content.append(Paragraph("• AutoCAD Electrical (Basic)", styles['Normal']))
content.append(Paragraph("• MS Office (Word, Excel, PowerPoint)", styles['Normal']))
content.append(Spacer(1, 10))

# Experience
content.append(Paragraph("<b>Industrial Experience</b>", styles['Heading2']))
content.append(Paragraph("O/E/N India Limited, Chakan MIDC (June–Aug 2025)", styles['Normal']))
content.append(Paragraph("• Worked in Sub-Assembly Department", styles['Normal']))
content.append(Paragraph("• Assisted in component handling and operations", styles['Normal']))
content.append(Spacer(1, 10))

# Projects
content.append(Paragraph("<b>Projects</b>", styles['Heading2']))
content.append(Paragraph("1. Solar Tracking System using IoT", styles['Normal']))
content.append(Paragraph(
    "• Developed Arduino-based dual-axis solar tracker for efficiency improvement",
    styles['Normal']
))
content.append(Paragraph("2. PIR Motion Sensor Light & Fan Control", styles['Normal']))
content.append(Paragraph(
    "• Automated system using PIR sensor to save electricity",
    styles['Normal']
))
content.append(Spacer(1, 10))

# Strengths
content.append(Paragraph("<b>Strengths</b>", styles['Heading2']))
content.append(Paragraph("• Fast learner and disciplined", styles['Normal']))
content.append(Paragraph("• Good teamwork and communication", styles['Normal']))
content.append(Paragraph("• Ability to work under pressure", styles['Normal']))
content.append(Spacer(1, 10))

# Languages
content.append(Paragraph("<b>Languages</b>", styles['Heading2']))
content.append(Paragraph("English, Hindi, Marathi", styles['Normal']))
content.append(Spacer(1, 10))

# Declaration
content.append(Paragraph("<b>Declaration</b>", styles['Heading2']))
content.append(Paragraph(
    "I hereby declare that the above information is true to the best of my knowledge.",
    styles['Normal']
))

# Build PDF
doc.build(content)

print("Resume Generated Successfully!")