

vertices = pwintz.polyhedrons.verticesOfConvexHull([[1; 1], [0; 0], [1; 0]])
vertices = pwintz.polyhedrons.verticesOfConvexHull([[1; 1], [0; 0], [1; 0], [0; 1]])
vertices = pwintz.polyhedrons.verticesOfConvexHull([[1; 1], [-1; 1], [1; -1], [-1; -1]])

% Check that interior points are not included.
vertices = pwintz.polyhedrons.verticesOfConvexHull([[1; 1], [-1; 1], [1; -1], [-1; -1], [0; 0]])

% One point.
pwintz.polyhedrons.verticesOfConvexHull([[1; 1]])

% Single point, repeated.
pwintz.polyhedrons.verticesOfConvexHull([[1; 1], [1; 1]])

% Two points.
pwintz.polyhedrons.verticesOfConvexHull([[0; 0], [1; 0]])

% Two points with one repeated.
pwintz.polyhedrons.verticesOfConvexHull([[0; 0], [0; 0], [1; 0]])

% Single point, repeated, 3D
pwintz.polyhedrons.verticesOfConvexHull([[1; 1; 0], [1; 1; 0]])

% Two points, 3D
pwintz.polyhedrons.verticesOfConvexHull([[1; 1; 0], [1; 1; 1]])

% Three points, 3D
pwintz.polyhedrons.verticesOfConvexHull([[1; 1; 0], [1; 1; 1], [1; 4; -1]])

% Four points, 3D
pwintz.polyhedrons.verticesOfConvexHull([[1; 1; 0], [1; 1; 1], [1; 4; -1], [0; 0; 0]])

% Five points, with repeat, 3D
pwintz.polyhedrons.verticesOfConvexHull([[1; 1; 0], [1; 1; 1], [1; 4; -1], [0; 0; 0], [0; 0; 0]])

% Five points, with interior, 3D
pwintz.polyhedrons.verticesOfConvexHull([[10; 0; 0], [0; 10; 0], [0; 0; 10], [0; 0; 0], [1; 1; 1]])
