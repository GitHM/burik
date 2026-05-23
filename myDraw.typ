#import "@preview/cetz:0.4.0": *
#import draw: line

#let draw_tile(p1, p2, p3, p4, color) = {
  draw.merge-path(
    {
      line(p1, p2, p3, p4, p1)
    },
    fill: color,
    stroke: black,
  )
}

#let initial-face(z, spacing) = {
  let face = ()
  for i in range(3) {
    for j in range(3) {
      let x = i * (1cm + spacing) - (1.5cm + spacing)
      let y = j * (1cm + spacing) + (1.5cm + spacing)
      let p1 = (x: x, y: y, z: z)
      let p2 = (x: x + 1cm, y: y, z: z)
      let p3 = (x: x + 1cm, y: y - 1cm, z: z)
      let p4 = (x: x, y: y - 1cm, z: z)
      face = face + (p1, p2, p3, p4)
    }
  }
  face
}

/// Draw a 3d cube with the given cube data and parameters.
/// - cube (dictionary): The cube data containing the colors of each face.
/// - spacing (length)=0cm: The spacing between the tiles.
/// - z (length)=10cm: The depth of the cube.
/// - xangle (angle)=40deg: The angle of rotation around the x-axis.
/// - yangle (angle)=15deg: The angle of rotation around the y-axis.
#let draw-3d-cube(cube, spacing: 0cm, z: 10cm, xangle: 40deg, yangle: 15deg) = {
  // Draw front face
  let face = initial-face(z, spacing)
  for i in range(9) {
    let color = cube.f.at(i)
    let p1 = face.at(i * 4)
    let p2 = face.at(i * 4 + 1)
    let p3 = face.at(i * 4 + 2)
    let p4 = face.at(i * 4 + 3)
    draw_tile(p1, p2, p3, p4, color)
  }
  // Draw up face

  // Draw right face
}

#let draw-cube(cube) = {
  box(width: 5cm, stroke: blue)[
    #set align(left)
    #canvas(draw-3d-cube(cube, spacing: 0.1cm))
    #box(width: 4cm)[
      #raw("test")]
    #v(1cm)
  ]
}
