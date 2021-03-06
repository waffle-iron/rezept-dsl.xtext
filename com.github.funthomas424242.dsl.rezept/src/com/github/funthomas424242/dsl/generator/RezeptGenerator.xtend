/*
 * generated by Xtext 2.9.2
 */
package com.github.funthomas424242.dsl.generator

import com.github.funthomas424242.dsl.rezept.RezeptbuchProjekt
import org.eclipse.emf.ecore.resource.Resource
import org.eclipse.xtext.generator.AbstractGenerator
import org.eclipse.xtext.generator.IFileSystemAccess2
import org.eclipse.xtext.generator.IGeneratorContext

/**
 * Generates code from your model files on save.
 * 
 * See https://www.eclipse.org/Xtext/documentation/303_runtime_concepts.html#code-generation
 */
class RezeptGenerator extends AbstractGenerator {

	override  doGenerate(Resource resource, IFileSystemAccess2 fsa, IGeneratorContext context) {
		for (project : resource.allContents.toIterable.filter(RezeptbuchProjekt)) {
			fsa.generateFile(POMGenerator.getPOMFileName(project), POMGenerator.createPOMContent(project))
			fsa.generateFile(getDbkFileName(project,"book.dbk"), BookGenerator.createBookContent(fsa,project))
		}
	}
	
	
	def static getDbkFileName(RezeptbuchProjekt project, String fileName) {
		return project.groupId+"."+project.artifactId+"/src/main/docbkx/"+fileName;
	}
	
	
	
	
	
}
