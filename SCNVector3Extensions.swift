/*
* Copyright (c) 2013-2014 Kim Pedersen
*
* Permission is hereby granted, free of charge, to any person obtaining a copy
* of this software and associated documentation files (the "Software"), to deal
* in the Software without restriction, including without limitation the rights
* to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
* copies of the Software, and to permit persons to whom the Software is
* furnished to do so, subject to the following conditions:
*
* The above copyright notice and this permission notice shall be included in
* all copies or substantial portions of the Software.
*
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
* AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
* LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
* OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
* THE SOFTWARE.
 
 Replaced Float with CGFloat for use in macOS
*/

import Foundation
import SceneKit

public extension SCNVector3
{
	/**
	* Negates the vector described by SCNVector3 and returns
	* the result as a new SCNVector3.
	*/
    func negate() -> SCNVector3 {
		return self * -1
	}

	/**
	* Negates the vector described by SCNVector3
	*/
    mutating func negated() -> SCNVector3 {
		self = negate()
		return self
	}

	/**
	* Returns the length (magnitude) of the vector described by the SCNVector3
	*/
    func length() -> CGFloat {
        return CGFloat(sqrtf(Float(x*x + y*y + z*z)))
	}

	/**
	* Normalizes the vector described by the SCNVector3 to length 1.0 and returns
	* the result as a new SCNVector3.
	*/
    func normalized() -> SCNVector3 {
		return self / length()
	}

	/**
	* Normalizes the vector described by the SCNVector3 to length 1.0.
	*/
    mutating func normalize() -> SCNVector3 {
		self = normalized()
		return self
	}

	/**
	* Calculates the distance between two SCNVector3. Pythagoras!
	*/
    func distance(vector: SCNVector3) -> CGFloat {
		return (self - vector).length()
	}

	/**
	* Calculates the dot product between two SCNVector3.
	*/
    func dot(vector: SCNVector3) -> CGFloat {
		return x * vector.x + y * vector.y + z * vector.z
	}

	/**
	* Calculates the cross product between two SCNVector3.
	*/
    func cross(vector: SCNVector3) -> SCNVector3 {
		return SCNVector3Make(y * vector.z - z * vector.y, z * vector.x - x * vector.z, x * vector.y - y * vector.x)
	}
}

/**
* Adds two SCNVector3 vectors and returns the result as a new SCNVector3.
*/
public func + (left: SCNVector3, right: SCNVector3) -> SCNVector3 {
	return SCNVector3Make(left.x + right.x, left.y + right.y, left.z + right.z)
}

/**
* Increments a SCNVector3 with the value of another.
*/
public func += ( left: inout SCNVector3, right: SCNVector3) {
	left = left + right
}

/**
* Subtracts two SCNVector3 vectors and returns the result as a new SCNVector3.
*/
public func - (left: SCNVector3, right: SCNVector3) -> SCNVector3 {
	return SCNVector3Make(left.x - right.x, left.y - right.y, left.z - right.z)
}

/**
* Decrements a SCNVector3 with the value of another.
*/
public func -= ( left: inout SCNVector3, right: SCNVector3) {
	left = left - right
}

/**
* Multiplies two SCNVector3 vectors and returns the result as a new SCNVector3.
*/
public func * (left: SCNVector3, right: SCNVector3) -> SCNVector3 {
	return SCNVector3Make(left.x * right.x, left.y * right.y, left.z * right.z)
}

/**
* Multiplies a SCNVector3 with another.
*/
public func *= ( left: inout SCNVector3, right: SCNVector3) {
	left = left * right
}

/**
* Multiplies the x, y and z fields of a SCNVector3 with the same scalar value and
* returns the result as a new SCNVector3.
*/
public func * (vector: SCNVector3, scalar: CGFloat) -> SCNVector3 {
	return SCNVector3Make(vector.x * scalar, vector.y * scalar, vector.z * scalar)
}

/**
* Multiplies the x and y fields of a SCNVector3 with the same scalar value.
*/
public func *= ( vector: inout SCNVector3, scalar: CGFloat) {
	vector = vector * scalar
}

/**
* Divides two SCNVector3 vectors abd returns the result as a new SCNVector3
*/
public func / (left: SCNVector3, right: SCNVector3) -> SCNVector3 {
	return SCNVector3Make(left.x / right.x, left.y / right.y, left.z / right.z)
}

/**
* Divides a SCNVector3 by another.
*/
public func /= ( left: inout SCNVector3, right: SCNVector3) {
	left = left / right
}

/**
* Divides the x, y and z fields of a SCNVector3 by the same scalar value and
* returns the result as a new SCNVector3.
*/
public func / (vector: SCNVector3, scalar: CGFloat) -> SCNVector3 {
	return SCNVector3Make(vector.x / scalar, vector.y / scalar, vector.z / scalar)
}

/**
* Divides the x, y and z of a SCNVector3 by the same scalar value.
*/
public func /= ( vector: inout SCNVector3, scalar: CGFloat) {
	vector = vector / scalar
}

/**
* Negate a vector
*/
public func SCNVector3Negate(vector: SCNVector3) -> SCNVector3 {
	return vector * -1
}

/**
* Returns the length (magnitude) of the vector described by the SCNVector3
*/
public func SCNVector3Length(vector: SCNVector3) -> CGFloat
{
    return CGFloat(sqrtf(Float(vector.x*vector.x + vector.y*vector.y + vector.z*vector.z)))
}

/**
* Returns the distance between two SCNVector3 vectors
*/
public func SCNVector3Distance(vectorStart: SCNVector3, vectorEnd: SCNVector3) -> CGFloat {
    return SCNVector3Length(vector: vectorEnd - vectorStart)
}

/**
* Returns the distance between two SCNVector3 vectors
*/
public func SCNVector3Normalize(vector: SCNVector3) -> SCNVector3 {
    return vector / SCNVector3Length(vector: vector)
}

/**
* Calculates the dot product between two SCNVector3 vectors
*/
public func SCNVector3DotProduct(left: SCNVector3, right: SCNVector3) -> CGFloat {
	return left.x * right.x + left.y * right.y + left.z * right.z
}

/**
* Calculates the cross product between two SCNVector3 vectors
*/
public func SCNVector3CrossProduct(left: SCNVector3, right: SCNVector3) -> SCNVector3 {
	return SCNVector3Make(left.y * right.z - left.z * right.y, left.z * right.x - left.x * right.z, left.x * right.y - left.y * right.x)
}

/**
* Calculates the SCNVector from lerping between two SCNVector3 vectors
*/
public func SCNVector3Lerp(vectorStart: SCNVector3, vectorEnd: SCNVector3, t: CGFloat) -> SCNVector3 {
	return SCNVector3Make(vectorStart.x + ((vectorEnd.x - vectorStart.x) * t), vectorStart.y + ((vectorEnd.y - vectorStart.y) * t), vectorStart.z + ((vectorEnd.z - vectorStart.z) * t))
}

/**
* Project the vector, vectorToProject, onto the vector, projectionVector.
*/
public func SCNVector3Project(vectorToProject: SCNVector3, projectionVector: SCNVector3) -> SCNVector3 {
    let scale: CGFloat = SCNVector3DotProduct(left: projectionVector, right: vectorToProject) / SCNVector3DotProduct(left: projectionVector, right: projectionVector)
	let v: SCNVector3 = projectionVector * scale
	return v
}
